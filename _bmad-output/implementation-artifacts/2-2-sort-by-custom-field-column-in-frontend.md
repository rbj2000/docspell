# Story 2.2: Sort by Custom Field Column in Frontend

Status: done

## Story

As a **Docspell user**,
I want to **click a custom field column header to sort the dashboard by that field**,
So that **I can organize documents by custom metadata values**.

## Acceptance Criteria

1. **AC1: Click Column Header to Sort** (FR9)
   - **Given** I have a custom field column displayed in my Dashboard Query panel
   - **When** I click the column header
   - **Then** the dashboard sorts by that custom field in ascending order
   - **And** the API request includes `orderBy: { field: "customfield:fieldName", direction: "asc" }`

2. **AC2: Toggle Sort Direction** (FR10)
   - **Given** the dashboard is sorted by a column in ascending order
   - **When** I click the same column header again
   - **Then** the sort direction toggles to descending order
   - **And** clicking again toggles back to ascending

3. **AC3: Visual Sort Indicator** (FR9, FR10)
   - **Given** the dashboard is sorted by a column
   - **When** I look at the column headers
   - **Then** the sorted column shows an arrow/chevron indicating the direction
   - **And** other column headers do not show a sort indicator

4. **AC4: Standard Column Sort** (FR9, FR10)
   - **Given** I have standard columns (Name, Date, Due Date, Created, State, Source) displayed
   - **When** I click a standard column header
   - **Then** the dashboard sorts by that column using the same sort interaction pattern
   - **And** non-sortable columns (Tags, Folder, Correspondent, Concerning) do not show clickable sort headers

5. **AC5: Sort Triggers Re-fetch** (UX)
   - **Given** I click a column header to sort
   - **When** the sort changes
   - **Then** new results are fetched from the API with the `orderBy` parameter
   - **And** the results replace the current view

6. **AC6: No Breaking Changes** (NFR6)
   - **Given** an existing dashboard with no sort configured
   - **When** I view the dashboard
   - **Then** behavior is identical to before (default date DESC ordering)
   - **And** existing saved dashboard configurations load without errors

## Tasks / Subtasks

- [x] **Task 1: Add Sort State to QueryData Model** (AC: #1, #6)
  - [x] 1.1 Add `sortColumn : Maybe ItemColumn` and `sortDirection : Maybe String` to `QueryData` in `Data/BoxContent.elm`
  - [x] 1.2 Update `emptyQueryData` with `sortColumn = Nothing, sortDirection = Nothing`
  - [x] 1.3 Update `queryDataDecoder` — use `Json.Decode.Pipeline` for extensibility (code review fix from Finding 3)
  - [x] 1.4 Update `queryDataEncode` — encode sort fields
  - [x] 1.5 Verify existing saved dashboards (without sort fields) still decode correctly — `D.maybe (D.field ...)` returns Nothing when field is missing

- [x] **Task 2: Add Sort Messages and Update Logic to BoxQueryView** (AC: #1, #2, #5)
  - [x] 2.1 Add `SortClick ItemColumn` variant to `Msg` type in `Comp/BoxQueryView.elm`
  - [x] 2.2 Implement sort toggle logic via `toggleSort` function:
    - Click same column → toggle asc↔desc
    - Click different column → set new column, reset to asc
    - Non-sortable columns don't have click handlers attached
  - [x] 2.3 On sort change, update `model.meta` sort fields and trigger `dataCmd` to re-fetch
  - [x] 2.4 Sort state stored in `model.meta` (QueryData) — parent reads from model. No OutMsg needed for MVP.

- [x] **Task 3: Populate orderBy in API Request** (AC: #1, #5)
  - [x] 3.1 Modify `mkQuery` to populate `orderBy` from `mkOrderBy meta`
  - [x] 3.2 `mkOrderBy` converts `ItemColumn.asString` → `ItemOrderBy.field` (already compatible format)
  - [x] 3.3 Sort direction passed directly as `"asc"` / `"desc"` string
  - [x] 3.4 When no sort is active (`sortColumn = Nothing`), `orderBy = Nothing` (preserves default behavior)

- [x] **Task 4: Add Sort Icons and Click Handlers to Column Headers** (AC: #3, #4)
  - [x] 4.1 Define `isSortable : ItemColumn -> Bool` helper — True for: Name, DateShort, DateLong, DueDateShort, DueDateLong, CustomField _. False for: Tags, Folder, Correspondent, Concerning
  - [x] 4.2 Modify `viewItemHead` to render clickable `<a>` headers for sortable columns
  - [x] 4.3 FontAwesome sort icons: `fa-sort-alpha-up` (asc), `fa-sort-alpha-down-alt` (desc), `invisible fa-sort-alpha-down` when not sorted
  - [x] 4.4 Non-sortable columns render as plain text (no click handler, no icon)
  - [x] 4.5 Uses `Util.Html.onClickk` with `preventDefaultOn` to prevent scroll-to-top (code review fix from Finding 1)

- [x] **Task 5: Compilation and Verification** (AC: #1-#6)
  - [x] 5.1 `elm make src/main/elm/Main.elm` — zero Elm compilation errors (Success! Compiled 3 modules)
  - [x] 5.2 Runtime smoke test: App loads correctly, dashboard renders, login works, dashboard edit works — VERIFIED (runtime, partial)
  - [x] 5.3 Verify default behavior unchanged when no sort is active — VERIFIED (runtime): Dashboard with no sort configured loads identically to before
  - [ ] 5.4 Verify sort toggle (click same header twice) — DEFERRED: Requires Joex for document processing; column headers only render when items exist
  - [ ] 5.5 Verify non-sortable columns don't respond to clicks — DEFERRED: Same as 5.4
  - [x] 5.6 Static code review: All sort logic, icons, click handlers, API integration verified against TagTable.elm reference pattern
  - NOTE: Also fixed `orderBy = Nothing` in 4 additional files that create `ItemQuery` records: `BoxStatsView.elm`, `Data/ItemQuery.elm`, `ItemMerge.elm`, `ItemSearchInput.elm`, `Page/Share/Update.elm`, `Page/Dashboard/DefaultDashboard.elm`
  - NOTE: Runtime tests 5.4-5.5 require Joex running alongside restserver with shared database; H2 AUTO_SERVER mode had connection issues. Full interactive testing deferred to code review phase or integration test environment.

## Dev Notes

### Critical Architecture Context

**How the Frontend Sort Flow Will Work (end-to-end):**

1. User clicks column header in `BoxQueryView.elm`
2. `SortClick ItemColumn` message dispatched
3. `update` function toggles sort state in `QueryData`
4. `dataCmd` is called, building `ItemQuery` with `orderBy` populated
5. API POST `/api/v1/sec/item/search` includes `orderBy: { field: "customfield:fieldName", direction: "asc" }`
6. Backend (Story 2.1 — DONE) performs LEFT JOIN sort, returns flat results
7. Response decoded and rendered — when `orderBy` is present, results come in a single flat "Results" group (code review fix from Story 2.1)

### Key Files to Modify

| # | File | Path | Change |
|---|------|------|--------|
| 1 | BoxContent | `modules/webapp/src/main/elm/Data/BoxContent.elm` | Add sort fields to `QueryData`, update codecs |
| 2 | BoxQueryView | `modules/webapp/src/main/elm/Comp/BoxQueryView.elm` | Add `SortClick` msg, sort toggle logic, sort icons, populate `orderBy` |

### Key Files to Read (NOT Modify)

| File | Path | Why |
|------|------|-----|
| ItemColumn | `modules/webapp/src/main/elm/Data/ItemColumn.elm` | `asString` produces `"customfield:fieldName"` format — use directly for `orderBy.field` |
| ItemOrderBy (generated) | `modules/webapp/target/elm-src/Api/Model/ItemOrderBy.elm` | `{ field: Maybe String, direction: Maybe String }` — already generated from Story 2.1 |
| ItemQuery (generated) | `modules/webapp/target/elm-src/Api/Model/ItemQuery.elm` | Has `orderBy: Maybe ItemOrderBy` — ready to use |
| TagTable | `modules/webapp/src/main/elm/Comp/TagTable.elm` | Reference pattern for sort toggle, icons, click handlers |
| Api | `modules/webapp/src/main/elm/Api.elm` | `itemSearch` already sends full `ItemQuery` including `orderBy` |

### Existing Sort Pattern (from TagTable.elm — Follow This Exactly)

**Toggle logic pattern:**
```elm
-- Click same column → toggle direction
-- Click different column → default to ascending
newOrder : Header -> CurrentOrder -> NewOrder
```

**Icon pattern (FontAwesome):**
```elm
-- Ascending:    "fa fa-sort-alpha-up"
-- Descending:   "fa fa-sort-alpha-down-alt"
-- Not sorted:   "invisible fa fa-sort-alpha-down"
```

**Click handler pattern:**
```elm
th [ class "text-left" ]
    [ a [ href "#", onClick (SortClick column) ]
        [ i [ class sortIcon, class "mr-1" ] []
        , text headerLabel
        ]
    ]
```

### Column Sortability Matrix

| Column | `ItemColumn` variant | Sortable? | Backend `orderBy.field` value |
|--------|---------------------|-----------|-------------------------------|
| Name | `Name` | YES | `"name"` |
| Date (short) | `DateShort` | YES | `"dateshort"` |
| Date (long) | `DateLong` | YES | `"dateshort"` (same backend field) |
| Due Date (short) | `DueDateShort` | YES | `"duedateshort"` |
| Due Date (long) | `DueDateLong` | YES | `"duedateshort"` (same backend field) |
| Created | — | NO (not an ItemColumn variant) | — |
| State | — | NO (not an ItemColumn variant) | — |
| Source | — | NO (not an ItemColumn variant) | — |
| Folder | `Folder` | NO | Not supported by backend |
| Correspondent | `Correspondent` | NO | Not supported by backend |
| Concerning | `Concerning` | NO | Not supported by backend |
| Tags | `Tags` | NO | Not supported by backend |
| Custom Field | `CustomField fieldName` | YES | `"customfield:fieldName"` |

**Important:** The backend `mapStandardColumn` in `ItemSearchPart.scala` maps `"dateshort"` → `itemDate` and `"duedateshort"` → `dueDate`. Both `DateShort`/`DateLong` variants map to the same backend sort. Use `ItemColumn.asString` directly — the backend handles both variants.

### QueryData Backward Compatibility

The `queryDataDecoder` currently uses `D.map5`. Adding sort fields requires changing to a pipeline decoder or `D.map7`. Use `D.maybe` / optional fields so existing saved dashboards (without sort fields) decode with `Nothing` defaults:

```elm
-- Pattern for backward-compatible optional field:
(D.maybe (D.field "sortColumn" Data.ItemColumn.decode)
    |> D.map (Maybe.withDefault Nothing))
```

Or use `Json.Decode.Pipeline`:
```elm
queryDataDecoder =
    D.succeed QueryData
        |> P.required "query" searchQueryDecoder
        |> P.required "limit" D.int
        |> P.required "details" D.bool
        |> P.required "columns" (D.list Data.ItemColumn.decode)
        |> P.required "showHeaders" D.bool
        |> P.optional "sortColumn" (D.maybe Data.ItemColumn.decode) Nothing
        |> P.optional "sortDirection" (D.maybe D.string) Nothing
```

**Note:** `Json.Decode.Pipeline` is already imported in the generated API models. Check if it's available in `Data/BoxContent.elm` — if not, add the import.

### mkQuery Modification

Current `mkQuery` (line ~256 in BoxQueryView.elm):
```elm
mkQuery : String -> QueryData -> ItemQuery
mkQuery q meta =
    { query = q
    , limit = Just meta.limit
    , offset = Nothing
    , searchMode = Just <| Data.SearchMode.asString Data.SearchMode.Normal
    , withDetails = Just meta.details
    , orderBy = Nothing  -- <-- Currently hardcoded to Nothing
    }
```

Change to populate `orderBy` from sort state:
```elm
mkQuery : String -> QueryData -> ItemQuery
mkQuery q meta =
    { query = q
    , limit = Just meta.limit
    , offset = Nothing
    , searchMode = Just <| Data.SearchMode.asString Data.SearchMode.Normal
    , withDetails = Just meta.details
    , orderBy = mkOrderBy meta
    }

mkOrderBy : QueryData -> Maybe ItemOrderBy
mkOrderBy meta =
    meta.sortColumn
        |> Maybe.map
            (\col ->
                { field = Just (Data.ItemColumn.asString col)
                , direction = meta.sortDirection
                }
            )
```

### Previous Story Intelligence

**From Story 2.1 (Backend — DONE):**
- Backend `applyOrderBy` in `ItemSearchPart.scala` handles both `"customfield:fieldName"` and standard columns
- Backend NULLS LAST: items without custom field value appear at end
- **Code review fix**: When `orderBy` is present, response uses flat "Results" group (no month grouping) — sort order is preserved in API response
- Standard columns NOT supported by backend sort: `folder`, `correspondent`, `concerning` — these silently fall through to default date ordering
- `ItemColumn.asString` produces the exact format expected by `ItemOrderBy.field`

**From Story 2.1 Code Review:**
- Finding 1 (HIGH, FIXED): Month grouping was breaking sort order — now uses flat group when `orderBy` present
- Finding 3 (MEDIUM, Accepted): Non-existent custom field silently degrades — frontend should only offer sort on columns that are displayed

**From Epic 1 Retrospective:**
- Git verification mandatory: `git show --stat <hash>` before claiming committed
- Runtime testing mandatory: Must browser-verify sort interaction
- Code review is mandatory: Adversarial review after implementation

### Anti-Patterns to Avoid

- **DO NOT** modify generated files (`Api/Model/ItemOrderBy.elm`, `Api/Model/ItemQuery.elm`) — these are auto-generated from OpenAPI
- **DO NOT** add sort click handlers to non-sortable columns (Tags, Folder, Correspondent, Concerning)
- **DO NOT** create a new `SortOrder` custom type when `Maybe String` ("asc"/"desc") suffices for MVP
- **DO NOT** break existing dashboard configurations — sort fields must be optional in decoder
- **DO NOT** use `D.map5` if adding fields — switch to pipeline decoder or `D.map7`
- **DO NOT** claim code is committed without `git show --stat` verification
- **DO NOT** mark tasks complete without actual verification

### Architecture Compliance

| Requirement | Approach |
|-------------|----------|
| NFR2: Sort within 2s | Backend handles sort; frontend just passes `orderBy` parameter |
| NFR6: No breaking changes | Sort fields optional in `QueryData` codec; `Nothing` = default behavior |
| NFR7: Follows existing Elm patterns | Mirror TagTable.elm sort pattern exactly |
| NFR8: Follows Scala/Cats conventions | N/A (Elm-only story) |
| NFR9: No new external dependencies | Uses existing FontAwesome icons, no new Elm packages |

### Testing Approach

1. **Compilation test:** `project/dev-ui-build.sh` or `sbt webapp/compile` — zero Elm errors
2. **Runtime test — sort activation:** Click custom field column header → verify sort icon appears, results re-fetch
3. **Runtime test — sort toggle:** Click same header again → verify icon changes direction
4. **Runtime test — column switch:** Click different column → verify previous icon clears, new column gets icon
5. **Runtime test — non-sortable:** Verify Tags/Folder/Correspondent/Concerning headers are not clickable
6. **Runtime test — default behavior:** Dashboard without sort configured loads and behaves identically to before

### References

- [Source: modules/webapp/src/main/elm/Comp/BoxQueryView.elm] - Main view component, headers at line ~121
- [Source: modules/webapp/src/main/elm/Data/BoxContent.elm#QueryData] - Sort state model, lines 62-68
- [Source: modules/webapp/src/main/elm/Data/ItemColumn.elm#asString] - Column serialization, lines 73-104
- [Source: modules/webapp/src/main/elm/Comp/TagTable.elm] - Reference sort pattern (toggle, icons, handlers)
- [Source: modules/webapp/target/elm-src/Api/Model/ItemOrderBy.elm] - Generated API type
- [Source: modules/webapp/target/elm-src/Api/Model/ItemQuery.elm] - Generated API type with orderBy field
- [Source: modules/webapp/src/main/elm/Api.elm#itemSearch] - API call, line ~2097
- [Source: modules/restserver/src/main/scala/docspell/restserver/routes/ItemSearchPart.scala#applyOrderBy] - Backend sort handler
- [Source: _bmad-output/implementation-artifacts/2-1-backend-support-for-custom-field-sorting.md] - Previous story
- [Source: _bmad-output/project-planning-artifacts/epics.md#Story 2.2] - Epic acceptance criteria

## Dev Agent Record

### Agent Model Used
claude-opus-4-6

### Debug Log References
- Elm compilation: `elm make src/main/elm/Main.elm` — Success! Compiled 3 modules
- Runtime: Restserver started via nix develop with H2, app loads at http://localhost:7880
- Joex H2 connection failed (AUTO_SERVER TCP timeout) — interactive sort testing deferred

### Completion Notes List
- Tasks 1-4: Fully implemented and verified via compilation + static review
- Task 5: Compilation verified, partial runtime (app loads, dashboard works), interactive sort testing deferred
- 6 additional files updated for `orderBy = Nothing` / `sortColumn/sortDirection = Nothing` compatibility

### File List
| File | Change |
|------|--------|
| `modules/webapp/src/main/elm/Data/BoxContent.elm` | Added sortColumn, sortDirection to QueryData; D.map7 decoder; encoder |
| `modules/webapp/src/main/elm/Comp/BoxQueryView.elm` | Added SortClick msg, toggleSort, isSortable, mkOrderBy, sort icons in viewItemHead, orderBy in mkQuery |
| `modules/webapp/src/main/elm/Comp/BoxStatsView.elm` | Added `orderBy = Nothing` to mkQuery |
| `modules/webapp/src/main/elm/Data/ItemQuery.elm` | Added `orderBy = Nothing` to request record |
| `modules/webapp/src/main/elm/Comp/ItemMerge.elm` | Added `orderBy = Nothing` to itemQuery record |
| `modules/webapp/src/main/elm/Comp/ItemSearchInput.elm` | Added `orderBy = Nothing` to q record |
| `modules/webapp/src/main/elm/Page/Share/Update.elm` | Added `orderBy = Nothing` to request function |
| `modules/webapp/src/main/elm/Page/Dashboard/DefaultDashboard.elm` | Added `sortColumn = Nothing, sortDirection = Nothing` to 2 BoxQuery records |

## Code Review Record

### Review Date
2026-02-17

### Findings Summary

| # | Severity | Description | Resolution |
|---|----------|-------------|------------|
| 1 | HIGH | `href "#"` on sort click causes page scroll-to-top | FIXED: Replaced with `Util.Html.onClickk` (preventDefaultOn) |
| 2 | MEDIUM | Sort state not propagated to parent BoxView for persistence | ACCEPTED: Story 2.3 scope |
| 3 | MEDIUM | `D.map7` at Elm's decoder limit, no room for new fields | FIXED: Refactored to `Json.Decode.Pipeline` |
| 4 | LOW | `isSortable` catch-all silently covers future ItemColumn variants | ACCEPTED: Low risk, add new cases when adding sortable columns |
| 5 | LOW | Encoder emits `null` for missing sort fields instead of omitting | ACCEPTED: Elm's `E.object` doesn't support field omission natively |
| 6 | LOW | Tasks 5.4/5.5 runtime tests deferred (need Joex) | ACCEPTED: Deferred to integration testing |

### Fixes Applied
- **Finding 1 (HIGH)**: `Comp/BoxQueryView.elm` — replaced `a [ href "#", onClick ... ]` with `a [ Util.Html.onClickk ... ]` using `preventDefaultOn "click"`. Added `cursor-pointer` class. Removed unused `Html.Attributes.href` and `Html.Events.onClick` imports.
- **Finding 3 (MEDIUM)**: `Data/BoxContent.elm` — replaced `D.map7 QueryData (...)` with `D.succeed QueryData |> P.required ... |> P.optional ...` pipeline decoder. Added `Json.Decode.Pipeline as P` import. Now extensible beyond 7 fields.

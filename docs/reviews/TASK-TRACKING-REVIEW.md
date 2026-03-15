# TASK-TRACKING-REVIEW: FlipFlip in ASE-Pulse

**Date:** 2026-03-16
**Reviewer:** Claude Code (Opus 4.6)
**Scope:** ase-pulse task tracking accuracy for FlipFlip content completion

---

## 1. Current State of ASE-Pulse Task Tracking

### Architecture

ASE-Pulse uses a Supabase-backed schema with four core tables: `projects`, `tasks`, `agents`, and `ase_logs`. A Kanban board (`TaskKanban.tsx`) visualizes task status, and `v_project_progress` provides per-project completion metrics.

### FlipFlip in ASE-Pulse

- **Seed data** in `migration_001_ase_pulse.sql` creates FlipFlip as an active project with 5 agents (PM, Architect, Designer, Developer, QA Tester).
- **No tasks are seeded.** The `tasks` table has zero rows for FlipFlip after migration. The Kanban board and project card will show 0% progress / 0 tasks.
- **No ase_logs entries** document the content generation milestones.

### Gap Summary

FlipFlip has completed Phase 1 (admin system, 400 skills, 2680 sentences, 13400 expressions), but ASE-Pulse reflects none of this work. The dashboard reports 0 tasks and 0% completion.

---

## 2. What Should Be Updated

### Immediate: Seed FlipFlip Tasks

Insert task rows reflecting completed work. Recommended task breakdown:


| Title                                                         | Status    | completion_pct |
| ------------------------------------------------------------- | --------- | -------------- |
| Database schema & Supabase setup                              | completed | 100            |
| Admin dashboard (CRUD for types/skills/sentences/expressions) | completed | 100            |
| Content generation: Skills (400)                              | completed | 100            |
| Content generation: Sentences (2680)                          | completed | 100            |
| Content generation: Expressions L01-L100 (13400)              | completed | 100            |
| CSV import/export utility                                     | completed | 100            |
| Web app (Phase 2)                                             | pending   | 0              |
| Mobile app (Phase 3)                                          | pending   | 0              |


### Immediate: Backfill ase_logs

Insert log entries with timestamps for key milestones (schema creation, admin launch, content completion) so the Activity Feed has historical data.

---

## 3. Recommendations for Automated Task-Status Sync

### Option A: Webhook (Recommended for Phase 1)

Each service calls `POST /api/tasks/{id}/update` when a milestone completes. This is the simplest approach and matches the existing API pattern (start/revert/resume endpoints already exist).

**Implementation:**

1. Add a `PATCH /api/tasks/[id]/route.ts` endpoint accepting `{ status, completion_pct }`.
2. FlipFlip's admin or CI pipeline sends an HTTP call after verified milestones.
3. ASE-Pulse logs the event in `ase_logs` automatically.

**Pros:** No DB coupling, works across Vercel-deployed services, easy to add auth.
**Cons:** Requires each service to know the task ID and actively push updates.

### Option B: Supabase DB Trigger (Recommended for Phase 2+)

A shared Supabase instance uses triggers on service-specific tables to update `tasks` in ase-pulse automatically.

**Implementation:**

1. Create a `task_milestones` table or use Supabase Edge Functions.
2. When FlipFlip's content tables exceed thresholds (e.g., expressions count >= 13400), a DB function updates the corresponding ase-pulse task row.
3. Use `pg_net` extension to call a webhook if services are on separate Supabase projects.

**Pros:** Zero-effort from services after setup, real-time, single source of truth.
**Cons:** Tighter coupling, harder to debug, requires shared DB or cross-project HTTP.

### Recommendation

**Start with Option A (webhook).** It aligns with the existing API-first architecture, requires minimal new code (one PATCH endpoint), and keeps services decoupled. Migrate to Option B only when the number of services and tasks makes manual webhook calls burdensome.

---

## 4. Immediate Next Steps

1. Add a SQL migration to seed FlipFlip tasks with completed status (see table above).
2. Create `PATCH /api/tasks/[id]/route.ts` in ase-pulse for status updates.
3. Add a `complete` action button to the TaskKanban UI alongside start/revert/resume.
4. Document the webhook contract so future services can self-report progress.


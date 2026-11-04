-- Run once in your Supabase project's SQL Editor.
-- Only the signed-in owner can read or change their project row.
create table if not exists public.project_timelines (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  revision uuid not null,
  updated_at timestamptz not null default now()
);
alter table public.project_timelines enable row level security;
revoke all on public.project_timelines from anon;
grant select, insert, update on public.project_timelines to authenticated;
create policy "Read own timeline" on public.project_timelines for select to authenticated using ((select auth.uid()) = user_id);
create policy "Insert own timeline" on public.project_timelines for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Update own timeline" on public.project_timelines for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);

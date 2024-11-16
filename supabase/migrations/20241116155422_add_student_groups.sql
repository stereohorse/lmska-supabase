CREATE TABLE student_groups (
	id uuid primary key default gen_random_uuid(),
	name TEXT NOT NULL,
	created_at timestamptz default now()
);

alter table "student_groups" enable row level security;

create policy "Allow authenticated select access" 
on public.student_groups 
for select 
to authenticated using ((SELECT authorize('student_groups.select')));

create policy "Allow authenticated delete access" 
on public.student_groups 
for delete 
to authenticated using ((SELECT authorize('student_groups.delete')));

create policy "Allow authenticated update access" 
on public.student_groups 
for update 
to authenticated using ((SELECT authorize('student_groups.update')));

create policy "Allow authenticated insert access" 
on public.student_groups 
for insert 
to authenticated with check ((SELECT authorize('student_groups.insert')));

CREATE TABLE courses (
	id bigint primary key generated always as identity,
	name TEXT NOT NULL,
	created_at timestamptz default now()
);

alter table "courses" enable row level security;

create policy "Allow authenticated select access" 
on public.courses 
for select 
to authenticated using ((SELECT authorize('courses.select')));

create policy "Allow authenticated delete access" 
on public.courses 
for delete 
to authenticated using ((SELECT authorize('courses.delete')));

create policy "Allow authenticated update access" 
on public.courses 
for update 
to authenticated using ((SELECT authorize('courses.update')));

create policy "Allow authenticated insert access" 
on public.courses 
for insert 
to authenticated with check ((SELECT authorize('courses.insert')));

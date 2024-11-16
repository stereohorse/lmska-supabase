insert into public.role_permissions (role, permission)
values
  ('teacher', 'student_groups.select'),
  ('teacher', 'student_groups.insert'),
  ('teacher', 'student_groups.update'),
  ('teacher', 'student_groups.delete'),

  ('teacher', 'courses.select'),
  ('teacher', 'courses.insert'),
  ('teacher', 'courses.update'),
  ('teacher', 'courses.delete'),

  ('student', 'courses.select');

INSERT INTO
  auth.users (
    id,
    instance_id,
    ROLE,
    aud,
    email,
    raw_app_meta_data,
    raw_user_meta_data,
    is_super_admin,
    encrypted_password,
    created_at,
    updated_at,
    last_sign_in_at,
    email_confirmed_at,
    confirmation_sent_at,
    confirmation_token,
    recovery_token,
    email_change_token_new,
    email_change
  )
VALUES
  (
    'f522f802-1099-4a92-9e84-a534ac859fd4',
    '00000000-0000-0000-0000-000000000000',
    'authenticated',
    'authenticated',
    'teacher@lmska.com',
    '{"provider":"email","providers":["email"]}',
    '{}',
    FALSE,
    crypt('123', gen_salt('bf')),
    NOW(),
    NOW(),
    NOW(),
    NOW(),
    NOW(),
    '',
    '',
    '',
    ''
  );

INSERT INTO
  auth.identities (
    id,
    provider_id,
    provider,
    user_id,
    identity_data,
    last_sign_in_at,
    created_at,
    updated_at
  )
VALUES
  (
    (SELECT id FROM auth.users WHERE email = 'teacher@lmska.com'),
    (SELECT id FROM auth.users WHERE email = 'teacher@lmska.com'),
    'email',
    (SELECT id FROM auth.users WHERE email = 'teacher@lmska.com'),
    json_build_object('sub', (SELECT id FROM auth.users WHERE email = 'teacher@lmska.com')),
    NOW(),
    NOW(),
    NOW()
  );

INSERT INTO public.user_roles (user_id, role)
VALUES ('f522f802-1099-4a92-9e84-a534ac859fd4', 'teacher');

insert into public.student_groups (id, name)
values ('cbdd2e74-cd7a-4267-aff6-f1c2002b4008', 'Group 1'),
	   ('d10d0b6b-7aff-4db6-8f62-1aeeeb6f2de4', 'Group 2');

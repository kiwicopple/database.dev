create table if not exists members (
    id uuid primary key default gen_random_uuid(),
    created_at timestamptz not null default timezone('utc' :: text, now()),
    updated_at timestamptz not null default timezone('utc' :: text, now()),
    organization_id uuid references organizations,
    project_id uuid references projects,
    user_id uuid references auth.users,
    role text not null default 'developer'
)
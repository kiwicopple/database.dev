create table if not exists projects (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    created_at timestamptz not null default timezone('utc' :: text, now()),
    updated_at timestamptz not null default timezone('utc' :: text, now())
)
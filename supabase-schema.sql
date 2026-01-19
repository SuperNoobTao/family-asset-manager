-- Supabase SQL Setup for Family Asset Manager
-- Run this in Supabase SQL Editor

-- Create assets table
CREATE TABLE IF NOT EXISTS assets (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    product TEXT NOT NULL,
    owner TEXT NOT NULL,
    bank TEXT NOT NULL,
    flexibility TEXT NOT NULL,
    nature TEXT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    term TEXT,
    rate TEXT,
    start_date TEXT,
    end_date TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE assets ENABLE ROW LEVEL SECURITY;

-- Create policy - users can only see their own data
CREATE POLICY "Users can CRUD their own assets"
ON assets FOR ALL
TO authenticated
USING (auth.uid() = user_id);

-- Create index for better performance
CREATE INDEX idx_assets_user_id ON assets(user_id);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger to auto-update updated_at
DROP TRIGGER IF EXISTS update_assets_updated_at ON assets;
CREATE TRIGGER update_assets_updated_at
    BEFORE UPDATE ON assets
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Create a view for easier querying (optional)
CREATE OR REPLACE VIEW assets_summary AS
SELECT 
    user_id,
    owner,
    nature,
    SUM(amount) as total_amount,
    COUNT(*) as asset_count,
    MAX(updated_at) as last_updated
FROM assets
GROUP BY user_id, owner, nature;

-- USERS TABLE
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  role TEXT CHECK (role IN ('student', 'teacher', 'parent', 'admin')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- STUDENTS TABLE
CREATE TABLE students (
  user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  full_name TEXT NOT NULL,
  age INT,
  grade TEXT,
  parent_id UUID REFERENCES parents(user_id)
);

-- TEACHERS TABLE
CREATE TABLE teachers (
  user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  full_name TEXT NOT NULL,
  subject TEXT,
  level TEXT
);

-- PARENTS TABLE
CREATE TABLE parents (
  user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  full_name TEXT NOT NULL,
  phone TEXT
);

-- DATING PROFILES
CREATE TABLE dating_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  video_url TEXT,
  bio TEXT,
  interests TEXT[],
  zodiac TEXT,
  verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CAREER PROFILES
CREATE TABLE career_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  resume_url TEXT,
  skills TEXT[],
  experience TEXT,
  preferred_industry TEXT
);

-- COOPERATIVE WALLETS
CREATE TABLE coop_wallets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  balance NUMERIC DEFAULT 0,
  currency TEXT DEFAULT 'NGN'
);

-- TRANSACTIONS
CREATE TABLE transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  wallet_id UUID REFERENCES coop_wallets(id),
  amount NUMERIC NOT NULL,
  type TEXT CHECK (type IN ('deposit', 'withdrawal', 'transfer')),
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- MARKET INTELLIGENCE
CREATE TABLE market_insights (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  category TEXT,
  region TEXT,
  data JSONB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AGRICULTURE DATA
CREATE TABLE agric_data (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  crop_type TEXT,
  yield_report JSONB,
  ai_recommendation TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- FAKE PROPHET DETECTION REPORT
CREATE TABLE prophet_reports (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  submitted_by UUID REFERENCES users(id),
  prophet_name TEXT,
  video_url TEXT,
  ai_score NUMERIC,
  verdict TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Add complete database schema

  


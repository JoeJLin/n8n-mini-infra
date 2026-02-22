CREATE TABLE stock_reports (
    id SERIAL PRIMARY KEY,              -- 每次插入自动 +1
    symbol VARCHAR(20) NOT NULL,        -- 股票代码
    report_content TEXT NOT NULL,       -- 研报内容
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP -- 写入时间
);

-- 建立复合索引：让 n8n 按股票和时间查缓存时飞快
CREATE INDEX idx_stock_time ON stock_reports (symbol, created_at DESC);

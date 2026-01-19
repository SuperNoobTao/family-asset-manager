# 家庭资产管理 PWA

基于 Supabase 云同步的家庭资产管理应用，支持多设备数据同步。

## 功能特性

- 📊 资产列表展示
- 🧮 按人/银行/类型统计汇总
- ☁️ **云端同步**（多设备实时同步）
- ➕ 添加/编辑/删除资产
- 📱 PWA 功能（可安装、离线使用）
- 📤 导出/导入 CSV

## Supabase 配置

### 1. 创建 Supabase 项目

1. 访问 https://supabase.com 注册并登录
2. 点击 "New Project" 创建项目
3. 记录以下信息：
   - Project URL（如 `https://xxxxx.supabase.co`）
   - anon public key（如 `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`）

### 2. 创建数据表

在 Supabase 控制台中打开 **SQL Editor**，运行 `supabase-schema.sql` 文件中的 SQL 语句。

### 3. 配置应用

编辑 `index.html`，替换以下内容：

```javascript
const SUPABASE_URL = '你的Project URL';
const SUPABASE_ANON_KEY = '你的anon public key';
```

### 4. 启用 Email 认证（可选）

在 Supabase 控制台：
1. 进入 **Authentication** → **Providers**
2. 确保 Email 认证已启用

## 启动方式

### 本地预览

```bash
cd family-asset-manager
python3 -m http.server 8080
```

访问 http://localhost:8080

### 部署到生产环境

将整个文件夹部署到支持 HTTPS 的服务器或平台（如 Vercel、Netlify、Cloudflare Pages）。

## 目录结构

```
family-asset-manager/
├── index.html           # 主页面（包含 Supabase SDK）
├── manifest.json        # PWA 配置
├── sw.js                # Service Worker（离线支持）
├── supabase-schema.sql  # 数据库结构 SQL
└── README.md            # 说明文档
```

## 技术栈

- **前端**: 原生 HTML/CSS/JavaScript
- **后端**: Supabase (PostgreSQL)
- **认证**: Supabase Auth (Email/Password)
- **同步**: Supabase Realtime
- **PWA**: Service Worker + Manifest

## 注意事项

- **HTTPS 要求**: PWA 和部分浏览器 API 需要 HTTPS 环境
- **免费额度**: Supabase 免费层包含 500MB 数据库、50,000 月活跃用户
- **数据安全**: 启用了 RLS，用户只能访问自己的数据

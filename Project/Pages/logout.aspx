<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="Epic_Travelers.Pages.logout" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Signing Out... | Epic-Travellers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Content/css/style.css" />
    <script>
        // Wipe all client-side authentication storage
        try {
            localStorage.removeItem('epic_user');
            localStorage.removeItem('epic_auth');
            sessionStorage.clear();
        } catch(e) {}
        // Instantly redirect to login page
        window.location.replace('<%= ResolveUrl("~/Pages/login.aspx") %>');
    </script>
</head>
<body style="display:flex; align-items:center; justify-content:center; min-height:100vh; font-family:sans-serif; background:#f8fafc; color:#334155; margin:0;">
    <div style="text-align:center; padding:30px;">
        <div style="font-size:40px; margin-bottom:12px;">✈️</div>
        <h2 style="font-size:20px; font-weight:700; margin-bottom:8px;">Signing you out...</h2>
        <p style="font-size:14px; color:#64748b;">Redirecting to login page</p>
    </div>
</body>
</html>

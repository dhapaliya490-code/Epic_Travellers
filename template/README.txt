This package contains the Epic Travellers HTML template, reorganized into
the folder layout that ASP.NET Web Forms (.NET Framework) projects expect:

  /Content/css   -> style.css, components.css, animations.css, dark-mode.css
  /Scripts/js    -> main.js, components.js
  /Pages         -> all the original .html pages (index, about, packages,
                     destinations, package-details, blog, gallery, contact,
                     auth, dashboard, admin, sitemap, 404)
  manifest.json, robots.txt, sw.js -> site root files

FIXES APPLIED IN THIS VERSION
------------------------------
All CSS/JS links inside every file in /Pages were relative (e.g. "css/style.css"),
which broke once the file was moved into a subfolder. They've been changed to
root-relative paths so they resolve correctly once the site runs from an
ASP.NET (IIS Express) root, regardless of which folder/page you're on:

  href="css/style.css"        -> href="/Content/css/style.css"
  src="js/main.js"            -> src="/Scripts/js/main.js"
  href="manifest.json"        -> href="/manifest.json"
  href="assets/favicon.ico"   -> href="/favicon.ico"  (add your own favicon.ico
                                  to the project root - none was included in
                                  the original template)

WHEN YOU MOVE THIS CONTENT INTO YOUR MASTER PAGE
--------------------------------------------------
Once you copy the <link>/<script> tags into Site.Master, keep them as
root-relative paths (/Content/... , /Scripts/...) or convert to the ASP.NET
~/ syntax with runat="server", e.g.:

  <link href="~/Content/css/style.css" rel="stylesheet" runat="server" />

Remember: these paths only resolve correctly when the site is run through
IIS Express (F5 in Visual Studio), not by double-clicking the .html file
directly in File Explorer.

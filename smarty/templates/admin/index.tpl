{include file="admin/header.tpl" TITLE="Admin"}

<h1>Admin</h1>

<h2>ezRPG News</h2>
<iframe src="http://www.ezrpgproject.com/updates.php" style="width: 95%; border: 0px; height: 200px;"></iframe>


<h2>Admin Modules</h2>
<ul>
        <li><a href="index.php?mod=Members">Member Management</a></li>
        <li><a href="index.php?mod=Map">Map</a></li>
        <li><a href="index.php?mod=Missions">Missions</a></li>
</ul>

<p>
If you install extra admin modules, edit <em>smarty/templates/admin/index.tpl</em> to add links above.
</p>

{include file="admin/footer.tpl"}
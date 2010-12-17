{include file="admin/header.tpl" TITLE="Add Mission"}
<h1>Add Mission</h1>
<form action="index.php?mod=Missions&act=doadd" method="post" >
	<h6>
	<strong>*maximum characters for description and messages is 
	500. For title 255 for integers 11. HTML is ok for title, description, and 
	messages.</h6>
	Title:</strong></label><strong>&nbsp;&nbsp;</strong>&nbsp;
	<input name="title" type="text" maxlength="255"><br><strong>Description: </strong><br>
	<textarea cols="20" name="description" rows="2"></textarea><br>
	<strong>
		<strong>Difficulty:</strong><select name="difficulty">
	<option selected="">1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
	<option>8</option>
	<option>9</option>
	<option>10</option>
	</select><br>&nbsp;Required Items:</strong><br>Agility: <input name="agineeded" type="text"><br>
	Strength: <input name="strneeded" type="text"><br>Vitality:
	<input name="vitneeded" type="text"><br>Dexterity:
	<input name="dexneeded" type="text"><br>Energy:
	<input name="energy" type="text"><br><strong>Start Message:<br>
	<textarea cols="20" name="start" rows="2"></textarea><br>Success 
	Message:<br><textarea cols="20" name="complete" rows="2"></textarea><br>
	Failed Message:<br><textarea cols="20" name="fail" rows="2"></textarea><br>
	Awards:<br></strong>Money: <input name="money" type="text" maxlength="11"><br>Exp:
	<input name="exp" type="text" maxlength="11"><br>
	<input name="Submit1" type="submit" value="submit"><br></form>
	<br />
{include file="admin/footer.tpl"}
<html>

<head>
	<title>Index de notre forum</title>
	<link href="sources/forum.css" rel="stylesheet">
	<meta charset="UTF-8">


</head>

<body class="accueil">

<header>  
	<ul>
<?php

	session_start();

	$base = mysqli_connect("localhost", "root", "", "forum");
	mysqli_set_charset($base, "utf8");



	if (isset($_GET['sous-categorie']))
	{
	$caracteres="/?categorie=";
	$categorie=$_GET['numcategorie'];
	$caracteres2="/?topic=";
	$topic=$_GET['numtopic'];
	$_SESSION['categorie']=$_GET['nomcategorie'];

	$_SESSION['topic']=$_GET['nomtopic'];


	$pages=$caracteres."".$categorie."".$caracteres2."".$topic;

	header('location: sources/forum.php'.$pages);

	}
	if(isset($_POST['deco']))
	{
	unset($_SESSION['login']);
	unset($_SESSION['password']);
	}

	if(isset($_SESSION['login']))
	{
	$login=$_SESSION['login'];
	$querygrade="SELECT grade from utilisateurs where login='$login'";
	$resultgrade=mysqli_query($base, $querygrade);
	$grade=mysqli_fetch_array($resultgrade);

	if(($grade['grade']==1)||($grade['grade']==2))
	{
?>
	<div>
	<li><a href="sources/administration.php">Administration</a></li>
	</div>
	<?php
	}
	else
	{
	?>
	<div>
	</div>
	<?php
	}
	?>
	<div class="deco">
	<form  method="post" action="index.php">
		<input type="submit" name="deco" value="Déconnexion">
	</form>
	</div>
<?php
	}
	else
	{
?>
	<div>
	</div>
	<div>
	<li><a href="sources/connexion.php">Connexion</a></li>
	<li><a href="sources/inscription.php">Inscription</a></li>
	</div>
<?php
}
?>
	</ul>
</header>




<div class="logotitre">
	<img src="img/logogw2.png">
</div>

<?php


$sql = 'SELECT id, titre from categorie';

$query= mysqli_query($base, $sql);

?>
<main>
<section class="sectionaccueil">
<?php
while ($data=mysqli_fetch_array($query))
{
?>
	<article class="categorie">
		<span class="span"><?php echo $data['titre']; ?></span>

				<?php
				$sql2="SELECT sous_categorie.titre, sous_categorie.id  as idsous, id_categorie, categorie.id from sous_categorie, categorie where id_categorie = categorie.id";
				$query2=mysqli_query($base, $sql2);
				while($data2=mysqli_fetch_array($query2))
				{
				if($data2['id_categorie']==$data['id'])
				{
				?>
				<div>
				<form class="topic" method="get" action="index.php">
				<input type="hidden" name="numcategorie" value="<?php echo $data2['id_categorie'];?>">
				<input type="hidden" name="numtopic" value="<?php echo $data2['idsous']; ?>">
				<input type="hidden" name="nomcategorie" value="<?php echo $data['titre'];?>">
				<input type="hidden" name="nomtopic" value="<?php echo $data2['titre'];?>">
				<input class="data2" type="submit" name="sous-categorie" value="<?php echo $data2['titre'];?>">
				</form><br>
				</div>
				<?php
				}
				}
				?>
	</article>
<?php
}
?>
</section>
</main>


<div class="FooterBottomWrap">
	<div class="FooterBottom">
		<div class="FooterBottomInfo">
			
			</div>
			<div class="FooterBottomCopyright">
				<div class="FooterCopyrightBottom">
					<a class="colorchartes" href="https://www.blizzard.com/fr-fr/legal/8c41e7e6-0b61-42c4-a674-c91d8e8d68d3/politique-de-confidentialite-de-blizzard-entertainment">Charte de confidentialité</a>
					<a  class="colorchartes" href="https://www.blizzard.com/fr-fr/legal/511dbf9e-2b2d-4047-8243-4c5c65e0ebf1/terms-of-use-for-blizzards-websites">Mentions Légales</a>
				</div>
			
				</a>
			</div>
		</div>
	</div>
</div>

</body>
</html>

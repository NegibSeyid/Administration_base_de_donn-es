
<html lang="fr">
<head>
<meta charset="utf-8" />
<title>Reservation Cinema!</title>
</head>

<body>

<!-------  requettage de la base en utilisant le PDO ----------->


<p>liste des Clients:</p>

<?php

$pdo = new PDO('mysql:host=localhost;dbname=cinema', 'root', '');
foreach ($pdo->query('SELECT * FROM client') as $tableau) {
    echo $tableau['nomClient'].' - '.$tableau['prenomClient'].' - '.$tableau['dateNaissance'].'<br>';
} ?>

<p>liste des Films:</p>

<?php

$pdo = new PDO('mysql:host=localhost;dbname=cinema', 'root', '');
foreach ($pdo->query('SELECT * FROM film') as $tableau) {
    echo $tableau['titre'].' - '.$tableau['genre']. ' -' .$tableau['nomAuteur'].' -' .$tableau['dateProduction'].'<br>';
} ?>


<!-------  Authentification et de gestion de la sécurité d’un SGBD  ----------->


<?php

$pdo = new PDO('mysql:host=localhost;dbname=cinema', 'root', '');
$statement = $pdo->prepare('INSERT INTO users(email, username, password) VALUES (:email, :username, :password)');
$statement->bindValue(':email', 'negib@study.fr');
$statement->bindValue(':username', 'negib');

// Hash du mot de passe en utilisant BCRYPT
$statement->bindValue(':password', password_hash('p4$$w0rd', PASSWORD_BCRYPT));
if ($statement->execute()) {
    $user = $statement->fetch(PDO::FETCH_ASSOC);
    if ($user === false) {
        // Si aucun utilisateur ne correspond au login entré, on affiche une erreur
        echo 'Identifiants invalides';
    } else {
        // On vérifie le hash du password
        if (password_verify('p4$$w0rd', $user['password'])) {
            echo 'Bienvenue '.$user['username'];
        } else {
            echo 'Identifiants invalides';
        }
    }
} else {
    echo 'Impossible de récupérer l\'utilisateur';
}
 ?>

</body></html>
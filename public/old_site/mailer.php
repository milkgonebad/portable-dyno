<?PHP
$name = $HTTP_POST_VARS['nam'];
$company = $HTTP_POST_VARS['dukan'];
$phone = $HTTP_POST_VARS['fon'];
$email = $HTTP_POST_VARS['dak'];
$message = $HTTP_POST_VARS['message'];

if (empty($_POST['name'])) {
    $headers = 'From: ';
    if (!empty($name)) {
	$headers .= '"' . $name . '"';
    }
    if (!empty($email)) {
	$headers .= '<' . $email . '>';
    } else {
	$headers .= '<NoEmailGiven@portable-dyno.com>';
    }
    if (!empty($phone)) {
	$message .=  "\n" . $phone;
    }
    if (!empty($company)) {
	$message .= "\n" . $company;
    }

    $mail = mail('jblack@portable-dyno.com', 'Portable-Dyno.com Message', $message, $headers);
}
$header = header ('Location:feedback.html');
?>
<?php

define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'choi' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', 'utf8_unicode_ci' );
define('FS_METHOD', 'direct');

define('AUTH_KEY',         'g9ecw&*] E-:473KZRt+kLyzi||Y=9;Eu9L,:<M|nzoWtr:^/qwmxgxl .I215oY');
define('SECURE_AUTH_KEY',  'E$#l:3Xo=}(?c{o%zXr<iX_Q@;}@lo#-8q2 :w&vIMyp({=E&%8AJQ+dZ2,>J(t?');
define('LOGGED_IN_KEY',    '<86(#6{mv+p.0*T=Bd6u4yKvrD$U80J<TlfV|dx@Owca%)qNE.G+gYD,/`{tgkog');
define('NONCE_KEY',        'uHhO3bo;$Wl|QM]#ex9DL3|HQ@Z{Q3>J-|/D&][uzt_rOYZG>+&8-~_/Fu^A?w9U');
define('AUTH_SALT',        '>M$|peYR4GC9Ki<YP8XsV0<A1IYNAf*PEi7ww*8-fM]Zb+|2;mQ|*+mt.K0~}|+-');
define('SECURE_AUTH_SALT', '*|TNO e[=H:h{Qck}Eb<8SA-mHBP&:I}P!Q%=H<7JQ9FNGy`]d3vk|J+J.[I:6iH');
define('LOGGED_IN_SALT',   '3sykF]`fvrN0M-4xm^ze*;OUqt=`&dt~0OQvi 6GW)>9|6o-!>q*${^w]OE}F!qy');
define('NONCE_SALT',       '+]3:hV|t-2-A.&W:g*rHx6IBDDQk_|c5+cM/qj?F?]+=g-s/JY<zLeE$u#j{>X#D');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';

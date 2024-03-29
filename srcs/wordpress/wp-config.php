<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wp_pass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '/9/Z~Igi/xGlU FPT UZ:WMF4!IL1 ,T>s-V~|cBabpi0+L{e9;H@|<tb(4%iy48');
define('SECURE_AUTH_KEY',  'nO_!g/+P6h3#(]s.%;V%*I]t+wnMYXMm3R|I#-D|(x<0{W+%rYKPr+;>6+Wp2^ z');
define('LOGGED_IN_KEY',    'l{3]h-nZA1o W_wq2<W2t9WUUd(F(3t||~fpoI!a(i=6++eF[#HzGAV=R3-Xb9&W');
define('NONCE_KEY',        ',B6v_l{RA+7K!kx 4Q=j(PznO+g{y5._-KpB6N>-eShOv Q<x@&c<3!$c#(H(.:z');
define('AUTH_SALT',        'Ocu^X/YGbv#-/(wxx+glso[}{6+;K0Hn_`O-j6Y!Tj6a6wJNp,p@!7.W[<-csM#<');
define('SECURE_AUTH_SALT', 'N6`*CE-R),&Q`dV;cF~`,/Gom@|r9+I*k,7IqgUkEo#1Wk!LQ@sV-=)[ZlzpTYQd');
define('LOGGED_IN_SALT',   'p;?IH5m^c3l>ywu>MSvc*J)-5Q<,2neP/uF||k*:BaYOim@Zl+|uTQ-KyE=Z}(#p');
define('NONCE_SALT',       'F>Ij+=``sz;2|NE)ihhx $-|!UwxZF)iLQ8f+q=Sl LCy+%PU/LGc>Wnn-v:bRwX');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    'ch324sno': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    'jbtqke7g': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
    },
    'soneytcx': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '3w0mf3vk': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
    },
    's7disb49': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '2u7cn355': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
    },
    'anx4dnhh': {
      'en': 'I agree to the ',
      'es': 'Estoy de acuerdo con la',
    },
    'u7aanuzp': {
      'en': 'terms and conditions',
      'es': 'Términos y condiciones',
    },
    'nfhv2wil': {
      'en': 'Login',
      'es': 'Acceso',
    },
    '2v3rol5j': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'uf5zxfp0': {
      'en': 'Or login with',
      'es': 'O inicia sesión con',
    },
    'pf74v6uv': {
      'en': 'Sign in with Apple',
      'es': 'Iniciar sesión con Apple',
    },
    'x8ozjuke': {
      'en': 'Sign in with Google',
      'es': 'Inicia sesión con Google',
    },
    'vjixvuev': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SignupPage
  {
    'yz66x370': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    '2j4uwzkj': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
    },
    '9y8uehgk': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'buvn2cj0': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
    },
    'nw6z0tb9': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'xhhq9egu': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
    },
    '5djl4b7e': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    'ro5hrbu8': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
    },
    'dbwd4tm3': {
      'en': 'I agree to the ',
      'es': 'Estoy de acuerdo con la',
    },
    'chpk3so9': {
      'en': 'terms and conditions',
      'es': 'Términos y condiciones',
    },
    '1v925rj4': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
    },
    '63a58scc': {
      'en': 'Or signup with',
      'es': 'O regístrate con',
    },
    '8bmu1yqc': {
      'en': 'Sign in with Apple',
      'es': 'Iniciar sesión con Apple',
    },
    '9pak42dj': {
      'en': 'Sign in with Google',
      'es': 'Inicia sesión con Google',
    },
    '3vofbqvc': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // GrowPage
  {
    'cz33h4ix': {
      'en': 'Resources',
      'es': 'Recursos',
    },
    'n65zqtwt': {
      'en': 'Videos',
      'es': 'Vídeos',
    },
    'k7ebize0': {
      'en': 'Groups',
      'es': 'Grupos',
    },
    'u97q7kq6': {
      'en': 'Events',
      'es': 'Eventos',
    },
    'cjugnasg': {
      'en': 'Notes',
      'es': 'Notas',
    },
    'mrs4xdjx': {
      'en': 'Search recent...',
      'es': 'Buscar...',
    },
    '8nrvwa8i': {
      'en': 'Featured',
      'es': 'Presentado',
    },
    'tn8j0a9y': {
      'en': '+',
      'es': '+',
    },
    '26yvv7q8': {
      'en': '0',
      'es': '0',
    },
    'r6j1omlj': {
      'en': 'watched so far!',
      'es': '',
    },
    '8tzrh7zf': {
      'en': 'Use the search bar above to \ndiscover more videos.',
      'es': '',
    },
    'scsykgbu': {
      'en': 'Featured',
      'es': 'Presentado',
    },
    '5bx6jfdj': {
      'en': '+',
      'es': '+',
    },
    '2jdq42j7': {
      'en': '0',
      'es': '0',
    },
    'e25fls7v': {
      'en': 'members',
      'es': 'miembros',
    },
    'ywudscui': {
      'en': 'All Groups',
      'es': 'Todos los grupos',
    },
    'e5t1fb0k': {
      'en': 'Filter',
      'es': 'Filtrar',
    },
    '5wicson1': {
      'en': 'Reset Filter',
      'es': 'Restablecer filtro',
    },
    '7gxxu112': {
      'en': 'Use the filters above to \ndiscover more groups.',
      'es': '',
    },
    'n8usumdj': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'b4b7aa27': {
      'en': 'Featured',
      'es': 'Presentado',
    },
    'dwhh9akl': {
      'en': '-',
      'es': '',
    },
    '3iwdvh1h': {
      'en': 'All Events',
      'es': 'Todos los eventos',
    },
    'k0ne5g16': {
      'en': '-',
      'es': '',
    },
    'c0qrfghj': {
      'en': 'Results',
      'es': 'Resultados',
    },
    '0293rb7e': {
      'en': '-',
      'es': '',
    },
    'ecy30wjo': {
      'en': 'Use the search bar above to \ndiscover more videos.',
      'es': '',
    },
    'j53v2ein': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '7nbqiv6b': {
      'en': 'All Notes',
      'es': 'Todas las notas',
    },
    'n2y8cq8v': {
      'en': 'Results',
      'es': 'Resultados',
    },
    '2yu4sxca': {
      'en': 'Use the search bar above to \ndiscover more files.',
      'es': '',
    },
    'ngrcsik5': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SeriesOverview
  {
    'iypftf2a': {
      'en': '-',
      'es': '',
    },
    'tgoq05jn': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // ChooseUser
  {
    'p7apaydq': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'uk9vwq8w': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
    },
    'myunsaoz': {
      'en': 'Set as Leader',
      'es': 'Establecer como líder',
    },
    'hfo5c33a': {
      'en': 'Set as Leader',
      'es': 'Establecer como líder',
    },
    'y2hrfxt0': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // AllChats
  {
    '0xhl0pfy': {
      'en': 'Chat',
      'es': 'Charlar',
    },
    '3tkf0h3s': {
      'en': 'Search All People...',
      'es': 'Buscar en todas las personas...',
    },
    'mvoehaap': {
      'en': 'People',
      'es': 'Gente',
    },
    'cpy8wagr': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
    },
    'qinneko6': {
      'en': 'Recent Messages',
      'es': 'Mensajes recientes',
    },
    'nmv6kcbu': {
      'en': 'Pastor Chat',
      'es': 'Charla Pastoral',
    },
    '97hy9nyg': {
      'en':
          'Need help? Tap here to chat with \nsomeone from our pastoral care team...',
      'es':
          'Haga clic aquí para chatear con alguien\nde nuestro equipo de atención pastoral...',
    },
    'tae42bfo': {
      'en': 'Pastoral Request',
      'es': 'Solicitud Pastoral',
    },
    '6337hets': {
      'en': ':',
      'es': '',
    },
    'avh57c6x': {
      'en': 'Pastoral Request',
      'es': 'Solicitud Pastoral',
    },
    'bvigxnty': {
      'en': ' :',
      'es': '',
    },
    'bgoajgts': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // ChatPage
  {
    '6jcjpq9v': {
      'en': 'People',
      'es': 'Gente',
    },
    '5solkni7': {
      'en': ' at ',
      'es': 'en',
    },
    '4try126l': {
      'en': 'PDF File',
      'es': 'Archivo PDF',
    },
    '96rfr7ye': {
      'en': 'Click to View',
      'es': 'Click para ver',
    },
    'knnuox95': {
      'en': '(edited)',
      'es': '(editado)',
    },
    'pvm8f1af': {
      'en': '(edited)',
      'es': '(editado)',
    },
    '2refz5p7': {
      'en': 'PDF File',
      'es': 'Archivo PDF',
    },
    'mrya0cif': {
      'en': 'Click to View',
      'es': 'Click para ver',
    },
    'hrg4821r': {
      'en': '(edited)',
      'es': '(editado)',
    },
    'fvy8lszl': {
      'en': '(edited)',
      'es': '(editado)',
    },
    '9wdkqszi': {
      'en': 'New Poll!',
      'es': '¡Nueva encuesta!',
    },
    'lr900nd7': {
      'en': 'New Event!',
      'es': '¡Nuevo evento!',
    },
    '27vscla6': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CommunityPrayerPage
  {
    'y2o9gkwv': {
      'en': 'Prayer Requests',
      'es': 'Peticiones de oración',
    },
    '7sjd78cu': {
      'en': 'Community',
      'es': 'Comunidad',
    },
    'wwx9qtrv': {
      'en': 'Personal',
      'es': 'Personal',
    },
    'qcvhfz7z': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // groupsAttendance
  {
    '3vi8r0du': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '4e2w6j0i': {
      'en': 'Select who attended your group this week!',
      'es': '¡Selecciona quién asistió a tu grupo esta semana!',
    },
    'ca0vqc1g': {
      'en': 'Group Guests',
      'es': '',
    },
    'w08q8tj0': {
      'en': '(To delete guest, tap and hold)',
      'es': '',
    },
    'lcunxhqc': {
      'en': 'Add Guest',
      'es': '',
    },
    'hulfi4am': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PersonalPrayerPage
  {
    'i1hilp86': {
      'en': 'Prayer Requests',
      'es': 'Peticiones de oración',
    },
    'on28ffl7': {
      'en': 'Community',
      'es': 'Comunidad',
    },
    'pgkk3279': {
      'en': 'Personal',
      'es': 'Personal',
    },
    '6x1dji6i': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ProfilePage
  {
    'skesd4jx': {
      'en': 'Journal Streak',
      'es': 'Racha de diario',
    },
    'pipnwxx1': {
      'en': 'Journals',
      'es': 'Revistas',
    },
    'b0kg7b5q': {
      'en': 'In Prayer',
      'es': 'En oración',
    },
    '6ql92bhi': {
      'en': 'Friends',
      'es': 'Amigos',
    },
    'ip34c24y': {
      'en': '',
      'es': '',
    },
    'r67qd91s': {
      'en': '',
      'es': '',
    },
    'bmwyngjx': {
      'en': '',
      'es': '',
    },
    '53297ukx': {
      'en': '',
      'es': '',
    },
    'lypijgot': {
      'en': '',
      'es': '',
    },
    'o6xa5mck': {
      'en': '',
      'es': '',
    },
    '7y5xdyaz': {
      'en': 'Admin Console',
      'es': 'Preguntas centrales',
    },
    'tpx5jpyx': {
      'en': 'My Message Board',
      'es': 'Preguntas centrales',
    },
    '8vdw2nb4': {
      'en': 'Core Questions',
      'es': 'Preguntas centrales',
    },
    'orn5wbsv': {
      'en': 'My Groups',
      'es': 'Mis grupos',
    },
    'nwstxive': {
      'en': 'Heart Check',
      'es': 'Control del corazón',
    },
    'llycx83g': {
      'en': 'Giving Options',
      'es': 'Opciones de donación',
    },
    'y5k3yt00': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // EditProfilePage
  {
    'ym42bete': {
      'en': 'Update your profile information below!',
      'es': '¡Actualiza la información de tu perfil a continuación!',
    },
    'jvqbyz6h': {
      'en': 'First Name (optional)',
      'es': 'Nombre (opcional)',
    },
    '3k8qah96': {
      'en': 'Enter first name here...',
      'es': 'Introduzca el nombre aquí...',
    },
    'a97ant43': {
      'en': 'Last Name (optional)',
      'es': 'Apellido (opcional)',
    },
    'tpt7t42c': {
      'en': 'Enter last name here...',
      'es': 'Introduzca aquí el apellido...',
    },
    '4824taaa': {
      'en': 'Display name',
      'es': 'Nombre para mostrar',
    },
    'n3rb56oy': {
      'en': 'Enter display name here...',
      'es': 'Introduzca aquí el nombre para mostrar...',
    },
    '7xkqzakv': {
      'en': 'Birthday',
      'es': 'Cumpleaños',
    },
    '154esctt': {
      'en':
          'Birthday is required for our safety features that protect users that are 13 years or younger.',
      'es':
          'La fecha de nacimiento es obligatoria para nuestras funciones de seguridad que protegen a los usuarios menores de 13 años.',
    },
    'met9atdt': {
      'en': 'Middle School',
      'es': '',
    },
    'exxxwii2': {
      'en': 'High School',
      'es': '',
    },
    'beovmcre': {
      'en': 'College',
      'es': '',
    },
    '3petw9bq': {
      'en': 'Adult',
      'es': '',
    },
    'emmzw0jx': {
      'en': 'Age (Optional)',
      'es': 'Grado (opcional)',
    },
    'ypg3dv27': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'o6i40rd3': {
      'en': 'Male',
      'es': 'Masculino',
    },
    '8idml049': {
      'en': 'Female',
      'es': 'Femenino',
    },
    'jzzt1jmg': {
      'en': 'Gender (Optional)',
      'es': 'Género (opcional)',
    },
    'dzvubu9u': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'ebawe8ke': {
      'en': 'Delete Profile',
      'es': 'Borrar perfil',
    },
    'li7uexjf': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'op46j72k': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'xg7vqrh4': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // FriendsList
  {
    '1ikekx4t': {
      'en': 'Friends List',
      'es': 'Lista de amigos',
    },
    '3997n51w': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'hryt9vvs': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // OtherUserProfile
  {
    'dtjvyrqu': {
      'en': 'Journal Streak',
      'es': 'Racha de diario',
    },
    '79cg5ydf': {
      'en': 'Journals',
      'es': 'Revistas',
    },
    '7oujcaio': {
      'en': 'In Prayer',
      'es': 'En oración',
    },
    'gwbm0hbn': {
      'en': 'Friends',
      'es': 'Amigos',
    },
    '8v8z0drx': {
      'en': '',
      'es': '',
    },
    '0r5rn0to': {
      'en': '',
      'es': '',
    },
    'mfxiog42': {
      'en': '',
      'es': '',
    },
    'dagw1qsp': {
      'en': '',
      'es': '',
    },
    'hkaoekcu': {
      'en': '',
      'es': '',
    },
    'p1wdv6om': {
      'en': '',
      'es': '',
    },
    '8ullls7o': {
      'en': 'Pastoral Care Team',
      'es': 'Equipo de Atención Pastoral',
    },
    '9oevhb5s': {
      'en': 'Small Group Leader',
      'es': 'Líder de grupo pequeño',
    },
    '8x6d2z2l': {
      'en': 'Remove Friend',
      'es': 'Eliminar amigo',
    },
    '492oetv1': {
      'en': 'Send Friend Request',
      'es': 'Envia solicitud de amistad',
    },
    'utxywgz3': {
      'en': 'Awaiting Confirmation...',
      'es': 'Pendiente de confirmación...',
    },
    '6pbu7iea': {
      'en': 'Worship Journals',
      'es': 'Diarios de adoración',
    },
    '5177us2l': {
      'en': 'Scripture Journals',
      'es': 'Diarios de las Escrituras',
    },
    '3yc58dxa': {
      'en': 'Prayer Journals',
      'es': 'Diarios de oración',
    },
    'qoj0wnvb': {
      'en': 'Resource Journals',
      'es': 'Diarios de recursos',
    },
    '47zu1kuf': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PinnedMessages
  {
    '9syw2ig5': {
      'en': 'Pinned Messages',
      'es': 'Mensajes fijados',
    },
    'otlag311': {
      'en': ' at ',
      'es': 'en',
    },
    'd7ceo1sh': {
      'en': 'PDF File',
      'es': 'Archivo PDF',
    },
    '1v5q5kcz': {
      'en': 'Click to View',
      'es': 'Click para ver',
    },
    '5jqc923a': {
      'en': '(edited)',
      'es': '(editado)',
    },
    'z5al8kaz': {
      'en': '(edited)',
      'es': '(editado)',
    },
    'o2h444xh': {
      'en': 'PDF File',
      'es': 'Archivo PDF',
    },
    '7vgx1cdj': {
      'en': 'Click to View',
      'es': 'Click para ver',
    },
    '6xc666io': {
      'en': '(edited)',
      'es': '(editado)',
    },
    'xwth7m6v': {
      'en': '(edited)',
      'es': '(editado)',
    },
    'lyps0noa': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PastoralCare
  {
    'n27l0wm3': {
      'en': 'We\'re here to help.',
      'es': 'Estamos aquí para ayudar.',
    },
    'haz3aobx': {
      'en': 'Select a member of our care team...',
      'es': 'Seleccione un miembro de nuestro equipo de atención...',
    },
    't1fblkvh': {
      'en': 'Message',
      'es': 'Mensaje',
    },
    'aoyo4e8s': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // CreateNewChat
  {
    'r0l1c5r4': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    '6mbiecub': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
    },
    'j3qyg0jp': {
      'en': 'Message',
      'es': 'Mensaje',
    },
    'o938ax9y': {
      'en': 'Message',
      'es': 'Mensaje',
    },
    '1ayk8jiv': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // AddFriendsChat
  {
    'gweruc1d': {
      'en': 'Add People',
      'es': 'Añadir personas',
    },
    'p18hzwp1': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'v8hh8lh2': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
    },
    '4ul5uu2j': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EditProfilePageAuth
  {
    'hoazts41': {
      'en': 'Create your profile below.',
      'es': 'Crea tu perfil a continuación.',
    },
    'iv5cqyu4': {
      'en': 'First Name (optional)',
      'es': 'Nombre (opcional)',
    },
    'qwzg30bb': {
      'en': 'Enter first name here...',
      'es': 'Introduzca el nombre aquí...',
    },
    'dkgyj1sc': {
      'en': 'Last Name (optional)',
      'es': 'Apellido (opcional)',
    },
    'hbdxy5fv': {
      'en': 'Enter last name here...',
      'es': 'Introduzca aquí el apellido...',
    },
    'zzeb6mks': {
      'en':
          'First and last name are optional and only needed if you wish for others to more clearly identify you.',
      'es':
          'El nombre y apellido son opcionales y solo son necesarios si desea que otros lo identifiquen más claramente.',
    },
    'f2cn7e1b': {
      'en': 'Display name',
      'es': 'Nombre para mostrar',
    },
    'u4rmt2yp': {
      'en': 'Enter display name here...',
      'es': 'Introduzca aquí el nombre para mostrar...',
    },
    '8ouoowqt': {
      'en': 'Birthday',
      'es': 'Cumpleaños',
    },
    '8jgahr0h': {
      'en':
          'Birthday is required for our safety features that protect users that are 13 years or younger.',
      'es':
          'La fecha de nacimiento es obligatoria para nuestras funciones de seguridad que protegen a los usuarios menores de 13 años.',
    },
    '1qhfgwvr': {
      'en': 'Middle School',
      'es': 'Junior (Universidad)',
    },
    'ioygww0w': {
      'en': 'High School',
      'es': 'Senior (Universidad)',
    },
    'vfbrffht': {
      'en': 'College',
      'es': '',
    },
    'obeuvu90': {
      'en': 'Adult',
      'es': '',
    },
    '3m35r89d': {
      'en': 'Age Group (Optional)',
      'es': 'Grado (opcional)',
    },
    'lew3rv2h': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'jazd4mto': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'vazvaeje': {
      'en': 'Female',
      'es': 'Femenino',
    },
    'iasgiqko': {
      'en': 'Gender (Optional)',
      'es': 'Género (opcional)',
    },
    'yuxssp0b': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'ml2nqbaa': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    '8nbpf0rw': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'yuf182lj': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'j9rtql3l': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'rahihj2t': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '5959qkcc': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'ivo926d3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'qebpxds6': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PrayingPage
  {
    'uwwwecz2': {
      'en': 'Take a moment to pray \nfor this request...',
      'es': 'Tómate un momento para orar\npara esta petición...',
    },
    'yrhspg4u': {
      'en': 'When you\'re done, click below.',
      'es': 'Cuando haya terminado, haga clic a continuación.',
    },
    'fqxdysmp': {
      'en': 'Music Video Pad',
      'es': 'Almohadilla de vídeo musical',
    },
    'rb6cp7me': {
      'en': 'YouTube Video URL',
      'es': 'URL del vídeo de YouTube',
    },
    'ssy1uyev': {
      'en': 'https://youtu.be/Xx1MjhzKcYw',
      'es': 'https://youtu.be/Xx1MjhzKcYw',
    },
    'x0d4qz1j': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // WorshipArchives
  {
    '83c1i1kc': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'uacryg8h': {
      'en': 'Here\'s the archive of your worship journals!',
      'es': '¡Aquí está el archivo de sus diarios de adoración!',
    },
    '8n1r8i2r': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    '3skgvd54': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'a32c3lpd': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'w69cj6ig': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'v8qaaflc': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'bay44yn7': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'wuhr2zal': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    '2xbavhau': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'xkjhcf4h': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AllPracticesCompleted
  {
    'wddq1hy9': {
      'en': 'All Practices Completed',
      'es': 'Todas las prácticas completadas',
    },
    '7e67h25j': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'yvxta93e': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CurrentChatMembers
  {
    '8pcapbl6': {
      'en': 'Search by Name or Email...',
      'es': 'Buscar por nombre o correo electrónico...',
    },
    'rx0ivsei': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // DailyPracticeScheduling
  {
    '3w3gvcx8': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '6flicu30': {
      'en': 'Click the button to the right to schedule a new practice!',
      'es':
          '¡Haga clic en el botón a la derecha para programar una nueva práctica!',
    },
    'bg3yjupt': {
      'en': 'Worship',
      'es': 'Culto',
    },
    '9gs32fy1': {
      'en': 'Worship',
      'es': 'Culto',
    },
    'q81jlk4k': {
      'en': 'Scripture',
      'es': 'Sagrada Escritura',
    },
    '0lizzoze': {
      'en': 'Scripture',
      'es': 'Sagrada Escritura',
    },
    '76sjx5z9': {
      'en': 'Prayer',
      'es': 'Oración',
    },
    '3whvrp9v': {
      'en': 'Prayer',
      'es': 'Oración',
    },
    'ho0dtglv': {
      'en': 'Future Practices',
      'es':
          '¡Haga clic en el botón a la derecha para programar una nueva práctica!',
    },
    'kme1tp0x': {
      'en': 'Past Practices',
      'es':
          '¡Haga clic en el botón a la derecha para programar una nueva práctica!',
    },
    '9jbpyn10': {
      'en': 'Future Practices',
      'es':
          '¡Haga clic en el botón a la derecha para programar una nueva práctica!',
    },
    'aalphpjp': {
      'en': 'Past Practices',
      'es':
          '¡Haga clic en el botón a la derecha para programar una nueva práctica!',
    },
    '4da3fy4n': {
      'en': 'Future Practices',
      'es':
          '¡Haga clic en el botón a la derecha para programar una nueva práctica!',
    },
    'yxs7z5b2': {
      'en': 'Past Practices',
      'es':
          '¡Haga clic en el botón a la derecha para programar una nueva práctica!',
    },
    'ydcolf45': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AllPrayerList
  {
    'oend1loc': {
      'en': 'Prayer Requests',
      'es': 'Peticiones de oración',
    },
    '2y0basl4': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'ian04u1u': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AllPastoralRequests
  {
    'hklcf96n': {
      'en': 'Pastoral Requests',
      'es': 'Solicitudes pastorales',
    },
    'j8xxax9o': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'pamnkkmp': {
      'en': 'Recent Requests',
      'es': 'Solicitudes recientes',
    },
    'etm8mtld': {
      'en': 'Pastoral Request',
      'es': 'Solicitud Pastoral',
    },
    'iv3wm6s4': {
      'en': 'Pastoral Request',
      'es': 'Solicitud Pastoral',
    },
    'vohx1wcf': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // AllProfiles
  {
    'b6ltf0m5': {
      'en': 'All Profiles',
      'es': 'Todos los perfiles',
    },
    'an4x4yqz': {
      'en': 'Search by Name or Email...',
      'es': 'Buscar por nombre o correo electrónico...',
    },
    'cyljv335': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ScriptureArchives
  {
    '38ynkyob': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'x7zqtc0a': {
      'en': 'Here\'s the archive of your scripture journals!',
      'es': '¡Aquí está el archivo de sus diarios de las Escrituras!',
    },
    'qmi8xaq5': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    '1sabpsql': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'a4wy5ndm': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'rbhic3ic': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    '0pg70ris': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'a4u6suax': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'nprhflhm': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'acvz119r': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    '5g24v6x5': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PrayerArchives
  {
    'cq0j2nbg': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '6ba637jp': {
      'en': 'Here\'s the archive of your prayer journals!',
      'es': '¡Aquí está el archivo de sus diarios de oración!',
    },
    'kgkdxo95': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    '3h9g4gqv': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'f674rs75': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    '588flb63': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'ztux3ymn': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'r8rohcto': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'bnsz75qg': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'w9sxrgt7': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'jt9r319i': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // MessageArchives
  {
    'q3if3yxc': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '48mf39ma': {
      'en': 'Here\'s the archive of your resource journals!',
      'es': '¡Aquí está el archivo de sus diarios de recursos!',
    },
    'rxuctn67': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    '5vasrbtf': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'e2gm400k': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'mueuj0rg': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'y56n6ouo': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    't7ktwabp': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'lyk6u9co': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'xymg2qvp': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    '7n2kjiov': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ProfileTags
  {
    '61yvpuqh': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    't0iaejsr': {
      'en': 'Click the button to the right to create a new profile tag!',
      'es':
          '¡Haga clic en el botón a la derecha para crear una nueva etiqueta de perfil!',
    },
    'qni19s4j': {
      'en': 'Search Tags...',
      'es': 'Buscar etiquetas...',
    },
    '9tkopgb3': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AllProfilesWithTag
  {
    'i2vggon5': {
      'en': 'Search by Name or Email...',
      'es': 'Buscar por nombre o correo electrónico...',
    },
    '85t0z153': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SoLSplashScreen
  {
    '1lo8ihxf': {
      'en':
          '\"So do not fear, for I am with you; do not be dismayed, for I am your God. I will strengthen you and help you; I will uphold you with my righteous right hand.\"',
      'es':
          '\"Así que no temas, porque yo estoy contigo; no desmayes, porque yo soy tu Dios. Yo te fortaleceré y te ayudaré; te sostendré con mi diestra de justicia\".',
    },
    '1ezsj7t3': {
      'en': 'Isaiah 41:10',
      'es': 'Isaías 41:10',
    },
    'k2j7zy2p': {
      'en': 'from',
      'es': 'Hola,',
    },
    'sxvmp9yw': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // onBoarding
  {
    'dd7fqutd': {
      'en': 'Worship',
      'es': 'Culto',
    },
    '6dfs19oh': {
      'en': 'Scripture',
      'es': 'Sagrada Escritura',
    },
    '289aw6jr': {
      'en': 'Prayer',
      'es': 'Oración',
    },
    '4neuznkv': {
      'en': 'Engage Daily',
      'es': 'Participar diariamente',
    },
    '14mcwd1c': {
      'en':
          'Daily discipleship is founded on daily disciplines. Engage together.',
      'es':
          'El discipulado diario se basa en disciplinas diarias. Participar juntos.',
    },
    'd5ipl7ml': {
      'en': 'Next',
      'es': 'Próximo',
    },
    'y0jgh9mu': {
      'en': 'People',
      'es': 'Gente',
    },
    'ozepjpc8': {
      'en': 'C.S. Lewis',
      'es': 'C. S. Lewis',
    },
    'h2hlgkpm': {
      'en': 'Charles Spurg...',
      'es': 'Carlos Spurge...',
    },
    'km1064wp': {
      'en': 'J.R.R Tolkien',
      'es': 'J. R. R. Tolkien',
    },
    'u0mel8dc': {
      'en': 'Billy Graham',
      'es': 'Billy Graham',
    },
    'a0fgj3u1': {
      'en': 'C.S. Lewis',
      'es': 'C. S. Lewis',
    },
    'u3iln4md': {
      'en': 'Recent Messages',
      'es': 'Mensajes recientes',
    },
    'ap95vbh8': {
      'en': 'Pastoral Request',
      'es': 'Solicitud Pastoral',
    },
    '1vckntdt': {
      'en': 'Pastor Chat',
      'es': 'Charla Pastoral',
    },
    'jbt5ecdq': {
      'en': 'J.R.R. Tolkien:',
      'es': 'JRR Tolkien:',
    },
    'ie3h5k7q': {
      'en': 'I need prayer for...',
      'es': 'Necesito oración por...',
    },
    'kbgmt8ez': {
      'en': 'Jehovah Java',
      'es': 'Jehová Java',
    },
    'y63e0k3m': {
      'en': 'Charles Spurgeon:',
      'es': 'Carlos Spurgeon:',
    },
    '3ogt0n0g': {
      'en': 'Ya\'lls coffee must have...',
      'es': 'Su café debe tener...',
    },
    'krdyuyrm': {
      'en': 'Message Friends',
      'es': 'Mensaje amigos',
    },
    'g9m0ij2i': {
      'en':
          'Connect with your friends and your pastors. Simple, easy, and all in one place.',
      'es':
          'Conéctate con tus amigos y tus pastores. Sencillo, fácil y todo en un solo lugar.',
    },
    'ywepzkit': {
      'en': 'Next',
      'es': 'Próximo',
    },
    'qrso02o0': {
      'en': 'C.S. Lewis',
      'es': 'C. S. Lewis',
    },
    '13bh43ge': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'pv5qf7xx': {
      'en': 'Please pray that our ',
      'es': 'Por favor oren para que nuestro',
    },
    'fwz41jfv': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    'f8au0c43': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'rr9v4ew5': {
      'en':
          'I would like prayer concerning a few books that I am releasing this year. I\'m not sure that anyone will read them...',
      'es':
          'Me gustaría orar por algunos libros que publicaré este año. No estoy seguro de que alguien los lea...',
    },
    'w4v5jwth': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    '9wb6ueag': {
      'en': 'Pray',
      'es': 'Orar',
    },
    'npixh41c': {
      'en': 'Message',
      'es': 'Mensaje',
    },
    'kwdjz1su': {
      'en': 'Share',
      'es': 'Compartir',
    },
    'utf2wfff': {
      'en': 'Pray for each other. \nTogether.',
      'es': 'Oren unos por otros.\nJuntos.',
    },
    'r4v7d91r': {
      'en':
          'Receive notifications when someone prays for you and let them know when your prayer has been answered!',
      'es':
          '¡Reciba notificaciones cuando alguien ore por usted y avíseles cuando su oración haya sido respondida!',
    },
    'yp8wpi2c': {
      'en': 'Explore Now',
      'es': 'Explora ahora',
    },
  },
  // Catechism
  {
    'mgu3gizf': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'zlakbokh': {
      'en': 'Core Questions presented by OneHope!',
      'es': '¡Bienvenido a las Preguntas principales presentadas por OneHope!',
    },
    'c8i67p83': {
      'en': 'All',
      'es': 'Todo',
    },
    'ic67x2el': {
      'en': 'All',
      'es': 'Todo',
    },
    'qwwfxv5b': {
      'en': 'Part 1',
      'es': 'Parte 1',
    },
    '3ckmiao7': {
      'en': 'Part 1',
      'es': 'Parte 1',
    },
    'wgh0fnw2': {
      'en': 'Part 2',
      'es': 'Parte 2',
    },
    'c8r5651y': {
      'en': 'Part 2',
      'es': 'Parte 2',
    },
    'eb2quhsq': {
      'en': 'Part 3',
      'es': 'parte 3',
    },
    'qk9asydf': {
      'en': 'Part 3',
      'es': 'parte 3',
    },
    '86bmc2e6': {
      'en': 'Show Answer',
      'es': 'Mostrar respuesta',
    },
    '9immo6c2': {
      'en': 'Show Question',
      'es': 'Mostrar pregunta',
    },
    'p6g293fk': {
      'en': 'Show Answer',
      'es': 'Mostrar respuesta',
    },
    '6ldtuscf': {
      'en': 'Show Question',
      'es': 'Mostrar pregunta',
    },
    'u2am5w3d': {
      'en': 'Show Answer',
      'es': 'Mostrar respuesta',
    },
    'hs540ao4': {
      'en': 'Show Question',
      'es': 'Mostrar pregunta',
    },
    'peqv39mn': {
      'en': 'Show Answer',
      'es': 'Mostrar respuesta',
    },
    'wayftac4': {
      'en': 'Show Question',
      'es': 'Mostrar pregunta',
    },
    'p4m64tli': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // GrowPagePDF
  {
    '219itqbg': {
      'en': 'PDF Viewer',
      'es': 'Visor de PDF',
    },
    '9ciqufo8': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // NotificationsSelection
  {
    'cod0qg0n': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '7s85xy4e': {
      'en': 'Click the tag below that you would like to notify!',
      'es':
          '¡Haga clic en la etiqueta a continuación que le gustaría notificar!',
    },
    'wrgd8l0n': {
      'en': 'Search Tags...',
      'es': 'Buscar etiquetas...',
    },
    '2zg7sgpv': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AddTagPeople
  {
    '5pzi9otm': {
      'en': 'Add People',
      'es': 'Añadir personas',
    },
    'ma8sehy0': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'havrmox0': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
    },
    '9hkmpvdr': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AdminDashboard
  {
    '2vxxm33q': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '8r1n8krs': {
      'en': 'Welcome to your Admin Dashboard!',
      'es': '¡Bienvenido a su Panel de administración!',
    },
    'afwyku3s': {
      'en': 'Awaiting Approval:',
      'es': 'Cuentas totales:',
    },
    'qg8atf16': {
      'en': 'Total Accounts: ',
      'es': 'Cuentas totales:',
    },
    'vbff8mid': {
      'en': 'Total Journal Completions',
      'es': 'Completaciones totales de diarios',
    },
    'dw65iofe': {
      'en': '1 Week',
      'es': '1 semana',
    },
    '456iur5a': {
      'en': '1 Week',
      'es': '1 semana',
    },
    'kiz5xrq7': {
      'en': '1 Month',
      'es': '1 mes',
    },
    'xmjlm5c5': {
      'en': '1 Month',
      'es': '1 mes',
    },
    'jg2tngps': {
      'en': '6 Months',
      'es': '6 meses',
    },
    'cryy3o83': {
      'en': '6 Months',
      'es': '6 meses',
    },
    'lxv2xbqb': {
      'en': '1 Year',
      'es': '1 año',
    },
    '12fwitnt': {
      'en': '1 Year',
      'es': '1 año',
    },
    'dlcs3mks': {
      'en': 'Recent Journals',
      'es': 'Días',
    },
    'adnftese': {
      'en': 'Completions',
      'es': 'Terminaciones',
    },
    'q4rhq8iy': {
      'en': 'Recent Journals',
      'es': 'Días',
    },
    'x38ioc7s': {
      'en': 'Completions',
      'es': 'Terminaciones',
    },
    'rugygg2g': {
      'en': 'Recent Journals',
      'es': 'Días',
    },
    '87w9av74': {
      'en': 'Completions',
      'es': 'Terminaciones',
    },
    'j66i1qvx': {
      'en': 'Recent Journals',
      'es': 'Días',
    },
    'g3u7i0k5': {
      'en': 'Completions',
      'es': 'Terminaciones',
    },
    'q3i0cpqv': {
      'en': 'Schedule Helper:',
      'es': 'Ayudante de programación:',
    },
    'yopnlwca': {
      'en': 'Daily Practices',
      'es': 'Prácticas Diarias',
    },
    '5dqr6mu9': {
      'en': 'Notifications:',
      'es': 'Notificaciones:',
    },
    'gnpb5mgr': {
      'en': 'Send Push Notifications',
      'es': 'Enviar notificaciones automáticas',
    },
    'mltascn3': {
      'en': 'Live Stream Banner',
      'es': 'Banner de transmisión en vivo',
    },
    '26kj8mjs': {
      'en': 'Pastoral Requests',
      'es': 'Solicitudes pastorales',
    },
    '852skxwr': {
      'en': 'Profile Tags',
      'es': 'Etiquetas de perfil',
    },
    'gk084e26': {
      'en': 'New Guests',
      'es': 'Revistas creadas',
    },
    'iae6f6bz': {
      'en': 'Prayer Requests',
      'es': 'Peticiones de oración',
    },
    '45xqz0nt': {
      'en': 'Heart Checks',
      'es': 'Controles del corazón',
    },
    'atu4z587': {
      'en': 'Group Stats',
      'es': 'Estadísticas del grupo',
    },
    'i1x02lt8': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AllHeartChecks
  {
    'r8ptlgza': {
      'en': 'Heart Checks',
      'es': 'Controles del corazón',
    },
    's9j0eig4': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'lz85h5c9': {
      'en': 'View Heart Check',
      'es': 'Ver cheque del corazón',
    },
    'fws2vc1g': {
      'en': 'View Heart Check',
      'es': 'Ver cheque del corazón',
    },
    'uyxnskzn': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // groupAnalytics
  {
    's9phvsaq': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'xb5p2ks9': {
      'en': 'Welcome to your Groups Dashboard!',
      'es': '¡Bienvenido al panel de grupos de tu grupo!',
    },
    '5cjce3sj': {
      'en': 'Total Groups:',
      'es': 'Total de grupos:',
    },
    'cp9pmy1o': {
      'en': 'Avg. Group Size: ',
      'es': 'Promedio Tamaño del grupo',
    },
    'g084se4v': {
      'en': 'Total Groups Stats',
      'es': 'Estadísticas totales de grupos',
    },
    'poa5jsd0': {
      'en': '1 Week',
      'es': '1 semana',
    },
    '7iwna87y': {
      'en': '1 Week',
      'es': '1 semana',
    },
    '1wvqnww7': {
      'en': '1 Month',
      'es': '1 mes',
    },
    '9iy20j31': {
      'en': '1 Month',
      'es': '1 mes',
    },
    'awf1xr0y': {
      'en': '6 Months',
      'es': '6 meses',
    },
    'purmsgob': {
      'en': '6 Months',
      'es': '6 meses',
    },
    'uy44alun': {
      'en': '1 Year',
      'es': '1 año',
    },
    'ibf7p7cx': {
      'en': '1 Year',
      'es': '1 año',
    },
    'aqc2hoix': {
      'en': '',
      'es': 'Días',
    },
    'czd54n04': {
      'en': '',
      'es': 'Terminaciones',
    },
    'x9hi7c3i': {
      'en': 'Attendance',
      'es': 'Asistencia',
    },
    'p8ktshus': {
      'en': 'People Added',
      'es': 'Personas agregadas',
    },
    'uuuhuwea': {
      'en': 'People Removed',
      'es': 'Personas eliminadas',
    },
    'h87oebqx': {
      'en': '',
      'es': 'Días',
    },
    '2hdq7cer': {
      'en': '',
      'es': 'Terminaciones',
    },
    'a0jh0xy3': {
      'en': 'Attendance',
      'es': 'Asistencia',
    },
    'z5xnt76w': {
      'en': 'People Added',
      'es': 'Personas agregadas',
    },
    'nbnvi8es': {
      'en': 'People Removed',
      'es': 'Personas eliminadas',
    },
    '2zedtyrs': {
      'en': '',
      'es': 'Días',
    },
    '3ytg0wdc': {
      'en': '',
      'es': 'Terminaciones',
    },
    'aj3mc7me': {
      'en': 'Attendance',
      'es': 'Asistencia',
    },
    '2aclrr1t': {
      'en': 'People Added',
      'es': 'Personas agregadas',
    },
    '2u5b2k5t': {
      'en': 'People Removed',
      'es': 'Personas eliminadas',
    },
    'k3b5h9co': {
      'en': '',
      'es': 'Días',
    },
    'zx6oydls': {
      'en': '',
      'es': 'Terminaciones',
    },
    'n7pwpyge': {
      'en': 'Attendance',
      'es': 'Asistencia',
    },
    'mafqt3wt': {
      'en': 'People Added',
      'es': 'Personas agregadas',
    },
    'ogtvxcfa': {
      'en': 'People Removed',
      'es': 'Personas eliminadas',
    },
    '8ymlngm2': {
      'en': 'Follow Up Needed:',
      'es': 'Notificaciones:',
    },
    'ahhjr45m': {
      'en': 'Open Groups',
      'es': 'Grupos abiertos',
    },
    '443jq5jc': {
      'en': 'Closed Groups',
      'es': 'Grupos Cerrados',
    },
    '3hzg6wnn': {
      'en': 'All Ratings',
      'es': 'Todas las calificaciones',
    },
    'tcqn9s6e': {
      'en': 'Average Rating',
      'es': 'Puntuación media',
    },
    '2gjh345t': {
      'en': 'Recent People',
      'es': 'Promedio Tamaño del grupo',
    },
    '6rhhujoc': {
      'en': 'People in Groups',
      'es': 'Personas en grupos',
    },
    'kcmbfqt8': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // NewGuests
  {
    'f2eubmch': {
      'en': 'New Guests',
      'es': '',
    },
    'vqtfz4ul': {
      'en':
          'Here\'s a list of guests that have been \nadded within the past 30 days.',
      'es': '',
    },
    'wfwalgc6': {
      'en': 'Search by Name or Email...',
      'es': 'Buscar por nombre o correo electrónico...',
    },
    '5kqy71wi': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // FollowupNeeded
  {
    'dmprvw95': {
      'en': 'Follow Up Needed',
      'es': '',
    },
    '1sf43u8p': {
      'en':
          'Here\'s a list of group members that have not \nattended in the past 30 days.',
      'es': '',
    },
    '4hpuvbs7': {
      'en': 'Search by Name or Email...',
      'es': 'Buscar por nombre o correo electrónico...',
    },
    '3cs4r10v': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // adminGroupsRatingsView
  {
    'zpuekd00': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '017r5nko': {
      'en': 'Click any group below to view their ratings!',
      'es':
          '¡Haga clic en cualquier grupo a continuación para ver sus calificaciones!',
    },
    'jc1ufvmh': {
      'en': 'All Groups',
      'es': 'Todos los grupos',
    },
    'x4thx922': {
      'en': 'Filter',
      'es': 'Filtrar',
    },
    '9hx6bk9v': {
      'en': 'Reset Filter',
      'es': 'Restablecer filtro',
    },
    'n0wrc693': {
      'en': 'See more details',
      'es': 'Ver más detalles',
    },
    '5jyqlvvt': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // myGroupsPage
  {
    'pf9a0tag': {
      'en': 'Your Groups',
      'es': 'Tus grupos',
    },
    'rrtqwnvx': {
      'en': 'All of your current small groups are listed\nbelow!',
      'es': 'Tus grupos',
    },
    'xgni6c0c': {
      'en': 'Featured',
      'es': 'Presentado',
    },
    'wz83ktpj': {
      'en': '+',
      'es': '+',
    },
    'q3v2c6h6': {
      'en': '0',
      'es': '0',
    },
    'aq6de9hl': {
      'en': 'members',
      'es': 'miembros',
    },
    'bo9b2aff': {
      'en': 'All Groups',
      'es': 'Todos los grupos',
    },
    '8gvns0yh': {
      'en': 'Filter',
      'es': 'Filtrar',
    },
    'jc5tttiy': {
      'en': 'Reset Filter',
      'es': 'Restablecer filtro',
    },
    'qhk062h1': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // groupsRatings
  {
    'wcrtyp6s': {
      'en': 'Group Ratings',
      'es': 'Calificaciones de grupo',
    },
    'pzznccrp': {
      'en': 'Featured',
      'es': 'Presentado',
    },
    'bb83lxqp': {
      'en': 'Leader:',
      'es': 'Líder:',
    },
    '1gmmwmbw': {
      'en': 'All Ratings',
      'es': 'Todas las calificaciones',
    },
    'bb1wbivr': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AddGroupPeople
  {
    'mxl28paa': {
      'en': 'Members',
      'es': 'Miembros',
    },
    'xsu90hra': {
      'en': 'Search People...',
      'es': 'Busca gente...',
    },
    'e2o7ezek': {
      'en': 'Search Results',
      'es': 'Resultados de la búsqueda',
    },
    '0jnichdt': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // GroupDetails
  {
    '3hi93yhl': {
      'en': '+',
      'es': '+',
    },
    'w5s4ahch': {
      'en': 'members',
      'es': 'miembros',
    },
    'si17wspc': {
      'en': 'Go to Group Chat',
      'es': 'Ir al chat grupal',
    },
    'rupweaeg': {
      'en': 'Message leader',
      'es': 'Líder del mensaje',
    },
    'g0tmxq73': {
      'en': 'You are a member of this group!',
      'es': '¡Eres miembro de este grupo!',
    },
    'bhvkwxlx': {
      'en': 'This community is open!',
      'es': '¡Esta comunidad está abierta!',
    },
    '0z6daso6': {
      'en': 'This community is invite only',
      'es': 'Esta comunidad es solo por invitación',
    },
    'a5f8rqbh': {
      'en': 'Chats',
      'es': 'Charlas',
    },
  },
  // adminGroupsViewClosed
  {
    'fysu94eq': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'qu8xb9l1': {
      'en': 'Click any group below to view their ratings!',
      'es':
          '¡Haga clic en cualquier grupo a continuación para ver sus calificaciones!',
    },
    'amdk4g2v': {
      'en': 'All Groups',
      'es': 'Todos los grupos',
    },
    '75y8y4t1': {
      'en': 'Filter',
      'es': 'Filtrar',
    },
    '1jzepvu8': {
      'en': 'Reset Filter',
      'es': 'Restablecer filtro',
    },
    'vxf8dsds': {
      'en': 'See more details',
      'es': 'Ver más detalles',
    },
    '5x32pbhy': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // adminGroupsViewOpen
  {
    'bldrssal': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'ybnt2rjw': {
      'en': 'Click any group below to view their ratings!',
      'es':
          '¡Haga clic en cualquier grupo a continuación para ver sus calificaciones!',
    },
    'zib29wax': {
      'en': 'All Groups',
      'es': 'Todos los grupos',
    },
    '3s272o58': {
      'en': 'Filter',
      'es': 'Filtrar',
    },
    '2nc8qwpu': {
      'en': 'Reset Filter',
      'es': 'Restablecer filtro',
    },
    'ibjfrqog': {
      'en': 'See more details',
      'es': 'Ver más detalles',
    },
    's88xi8a2': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // adminGroupsViewAll
  {
    '2ew4utg0': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'jhnoxz37': {
      'en': 'Click any group below to view their ratings!',
      'es':
          '¡Haga clic en cualquier grupo a continuación para ver sus calificaciones!',
    },
    'ppp1q39r': {
      'en': 'All Groups',
      'es': 'Todos los grupos',
    },
    'rsyff27s': {
      'en': 'Filter',
      'es': 'Filtrar',
    },
    'u1trf25m': {
      'en': 'Reset Filter',
      'es': 'Restablecer filtro',
    },
    'uz59gf3k': {
      'en': 'See more details',
      'es': 'Ver más detalles',
    },
    'ob2h0wjp': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AllProfilesinGroups
  {
    'dhi2y2w7': {
      'en': 'All Profiles',
      'es': 'Todos los perfiles',
    },
    'j5pwm4s6': {
      'en': 'Search by Name or Email...',
      'es': 'Buscar por nombre o correo electrónico...',
    },
    'psebabc7': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // MyHeartChecks
  {
    '1ahzftz3': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '5gb2p30o': {
      'en': 'Here\'s the overview of your Heart Check Archive!',
      'es': '¡Aquí está la descripción general de su archivo Heart Check!',
    },
    'dd4859f5': {
      'en': 'View Heart Check',
      'es': 'Ver cheque del corazón',
    },
    'curm0pgd': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // HomePage
  {
    'yrs2xst1': {
      'en': 'Journal Streak',
      'es': 'Racha de diario',
    },
    'upz5buc4': {
      'en': 'We\'re ',
      'es': 'Eran',
    },
    'l44tq1bm': {
      'en': 'live! ',
      'es': '¡vivir!',
    },
    '7co1dlgi': {
      'en': 'Click here to join.',
      'es': 'Haga clic aquí para unirse.',
    },
    'gy0bu9tu': {
      'en': 'Here\'s your resources for today!',
      'es': '¡Aquí están tus recursos para hoy!',
    },
    '6czfhn4v': {
      'en': '+',
      'es': '+',
    },
    '3gngcohu': {
      'en': '0',
      'es': '0',
    },
    '5of9i4o4': {
      'en': 'have completed!',
      'es': '¡Han completado!',
    },
    'nf1uy9uj': {
      'en': 'Recent Activity',
      'es': 'Actividad reciente',
    },
    '5tk0053j': {
      'en': 'Show',
      'es': 'Espectáculo',
    },
    'nqqrnbnu': {
      'en': 'Recent Activity',
      'es': 'Actividad reciente',
    },
    'f8zsg8mr': {
      'en': 'Hide',
      'es': 'Esconder',
    },
    'uwgbneg7': {
      'en': 'New message:',
      'es': 'Nuevo mensaje:',
    },
    'x5wrj1f2': {
      'en': 'You have no messages... Yet!',
      'es': 'No tienes mensajes... ¡Aún!',
    },
    'h6sshw6d': {
      'en': 'Prayer Request',
      'es': 'Petición de oración',
    },
    '8qfaivah': {
      'en': 'Worship',
      'es': 'Culto',
    },
    'v5201155': {
      'en': 'START',
      'es': 'COMENZAR',
    },
    'pd2tuzi3': {
      'en': 'SHARE',
      'es': 'COMPARTIR',
    },
    'j2kzeiw9': {
      'en': 'UPDATE',
      'es': 'ACTUALIZAR',
    },
    '6nsyq01p': {
      'en': 'Scripture',
      'es': 'Sagrada Escritura',
    },
    '1vct4loq': {
      'en': 'START',
      'es': 'COMENZAR',
    },
    '25pzst71': {
      'en': 'SHARE',
      'es': 'COMPARTIR',
    },
    'vgf7hsev': {
      'en': 'UPDATE',
      'es': 'ACTUALIZAR',
    },
    '20z7wy4c': {
      'en': 'Prayer',
      'es': 'Oración',
    },
    'r5ahwu4x': {
      'en': 'START',
      'es': 'COMENZAR',
    },
    'aafwupfx': {
      'en': 'SHARE',
      'es': 'COMPARTIR',
    },
    'lox936tl': {
      'en': 'UPDATE',
      'es': 'ACTUALIZAR',
    },
    '91hxo5di': {
      'en': 'Settings',
      'es': 'Ajustes',
    },
    'i151cczt': {
      'en': 'Dark Mode',
      'es': 'Modo oscuro',
    },
    '7as0kl2f': {
      'en': 'Light Mode',
      'es': 'Modo de luz',
    },
    'k6js125n': {
      'en': 'Edit Loading Screen',
      'es': 'Editar pantalla de carga',
    },
    '7ds4mw68': {
      'en': 'General Notifications',
      'es': 'Notificaciones generales',
    },
    '4ia0f4zr': {
      'en': 'Privacy Policy',
      'es': 'política de privacidad',
    },
    'qi9xx8kl': {
      'en': 'Terms of Service',
      'es': 'Términos de servicio',
    },
    'upxhvh0j': {
      'en': 'Community Guidelines',
      'es': 'Principios de la Comunidad',
    },
    'dvhahgzx': {
      'en': 'Support',
      'es': 'Apoyo',
    },
    '3lg9simt': {
      'en': 'Back',
      'es': 'Atrás',
    },
    'kb2dps6g': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
    },
    '2pnp7gnb': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // JournalReplyPage
  {
    'q6jl4zg0': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'o74hf52a': {
      'en': 'Delete',
      'es': 'Borrar',
    },
    'jlw7pmsk': {
      'en': 'Edit',
      'es': 'Editar',
    },
    'yr4eyboc': {
      'en': 'Your reply here...',
      'es': 'Tu respuesta aquí...',
    },
    '3ris2n5x': {
      'en': 'typing...',
      'es': 'mecanografía...',
    },
    'wqgxye4l': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SeriesCatalog
  {
    'n3yfpy4n': {
      'en': 'Message Series',
      'es': 'Mensajes',
    },
    'g5ulhvji': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'jlt810dg': {
      'en': 'All Series',
      'es': 'Todos los mensajes',
    },
    'hq2jgqch': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // MessageBoard
  {
    'ghrjgafu': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'l8gfcnfh': {
      'en': 'Here\'s the latest notifications from your admins!',
      'es': '¡Bienvenido a las Preguntas principales presentadas por OneHope!',
    },
    'cguo8sg7': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // recentCheckins
  {
    'z2xd0fs0': {
      'en': 'Recent People',
      'es': 'Todos los perfiles',
    },
    'u6ihxsgy': {
      'en': 'Search by Name or Email...',
      'es': 'Buscar por nombre o correo electrónico...',
    },
    '6hepspzw': {
      'en': 'Most Recent Attendance:',
      'es': '',
    },
    'og7lco3m': {
      'en': 'Most Recent Attendance:',
      'es': '',
    },
    'gv7i2k70': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PercentageCompleted1
  {
    '5414svn0': {
      'en':
          'Congratulations! You\'ve completed one of your daily practices. Keep it up!',
      'es':
          '¡Felicidades! Has completado una de tus prácticas diarias. ¡Avanza!',
    },
    'ymxsvyqg': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // PercentageCompleted2
  {
    'kybloip1': {
      'en':
          'Congratulations! You\'ve completed one of your daily practices. Keep it up!',
      'es':
          '¡Felicidades! Has completado una de tus prácticas diarias. ¡Avanza!',
    },
    'u89gadse': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // EditPrayer
  {
    '8u3ljmxe': {
      'en': 'Edit Prayer Request',
      'es': 'Editar solicitud de oración',
    },
    't58hua5o': {
      'en': 'Make this prayer public?',
      'es': '¿Hacer pública esta oración?',
    },
    'f2efzx0d': {
      'en': 'Delete',
      'es': 'Borrar',
    },
    'hkqzvkmy': {
      'en': 'Update',
      'es': 'Actualizar',
    },
  },
  // CreatePrayer
  {
    'dkr6uq3a': {
      'en': 'Create Prayer Request...',
      'es': 'Crear solicitud de oración...',
    },
    'e61r2fvu': {
      'en': 'Write your prayer requests here...',
      'es': 'Escribe aquí tus peticiones de oración...',
    },
    'jxvjn92i': {
      'en': 'Make this prayer public?',
      'es': '¿Hacer pública esta oración?',
    },
    '8mtxajvk': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'ru5co3a4': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // PercentageCompleted3
  {
    'afhmcwkt': {
      'en':
          'Congratulations! You\'ve completed one of your daily practices! Great job!',
      'es':
          '¡Felicidades! ¡Has completado una de tus prácticas diarias! ¡Gran trabajo!',
    },
    'tvkd38jg': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // ScriptureUpdate
  {
    '54uwhbir': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    'n6mgjqux': {
      'en': 'Practice Title',
      'es': 'Título de la práctica',
    },
    'u4vgya6i': {
      'en': 'Video URL',
      'es': 'URL del vídeo',
    },
    '5uay08qu': {
      'en': 'Practice Response Question',
      'es': 'Pregunta de respuesta de práctica',
    },
    'jg3pllij': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    'n9cwdp2x': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    'b0rpo6or': {
      'en': 'Time Required',
      'es': 'Tiempo requerido',
    },
    'r4sj49e4': {
      'en': 'Video Description',
      'es': 'Descripción del video',
    },
    'uzxle8fb': {
      'en':
          '*Press submit to only update the edited fields. All other fields will remain unchanged.',
      'es':
          '*Presione enviar para actualizar solo los campos editados. Todos los demás campos permanecerán sin cambios.',
    },
    'qshoyf77': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '1p47sxqf': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    '0g55z87q': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'a5kp6hw2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'o8w0s56r': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'ofvmjl6v': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'fpbh0262': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'yxfm1vay': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'kuv8k803': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'qorf9ll5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'bzl7muug': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'z94dnhrx': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'k81bnhie': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'wye2uvfh': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'cv1br0su': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'wnhy90bq': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // WorshipUpdate
  {
    '3g11hunn': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    'd16y7bhr': {
      'en': 'Practice Title',
      'es': 'Título de la práctica',
    },
    '9ipx6k0j': {
      'en': 'Video URL',
      'es': 'URL del vídeo',
    },
    'uyvedysi': {
      'en': 'Practice Response Question',
      'es': 'Pregunta de respuesta de práctica',
    },
    'etu02gw2': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    'sfcovmso': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    'q7ika3d4': {
      'en': 'Time Required',
      'es': 'Tiempo requerido',
    },
    's3zup0to': {
      'en': 'Video Description',
      'es': 'Descripción del video',
    },
    '0n2nzeo1': {
      'en':
          '*Press submit to only update the edited fields. All other fields will remain unchanged.',
      'es':
          '*Presione enviar para actualizar solo los campos editados. Todos los demás campos permanecerán sin cambios.',
    },
    'it34pd1m': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '9mszrby6': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'hqt2ejjb': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '04rwplak': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ehrpyuyb': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '0q084hy6': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '8hjrvzlc': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'fyudl8i5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '92r3ciiw': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '4nfa5zoa': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'db51y2nv': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'ifbpkqvn': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '3tb9154a': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'rg5cypcn': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'zogbvaay': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'lkbq4zph': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // PrayerUpdate
  {
    'zuuxa6jb': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    'j2t93u9f': {
      'en': 'Practice Title',
      'es': 'Título de la práctica',
    },
    '04ec3rl7': {
      'en': 'Video URL',
      'es': 'URL del vídeo',
    },
    'cf4wrtb1': {
      'en': 'Practice Response Question',
      'es': 'Pregunta de respuesta de práctica',
    },
    'zj8yvb1n': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    '2dzky85l': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    '0y5d8lau': {
      'en': 'Time Required',
      'es': 'Tiempo requerido',
    },
    '6s4bbypo': {
      'en': 'Video Description',
      'es': 'Descripción del video',
    },
    '7o7d2cw2': {
      'en':
          '*Press submit to only update the edited fields. All other fields will remain unchanged.',
      'es':
          '*Presione enviar para actualizar solo los campos editados. Todos los demás campos permanecerán sin cambios.',
    },
    'aipuddbh': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'og1mjihs': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'qnbw06f4': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '21gibl00': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'nxxzgfik': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '179s9p9u': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'l0tov5f3': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'uknbccmw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'zv3mdslf': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'dqhjt1hc': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'vj7uvk1o': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '5y4s36l1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '6w2d6o9b': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'r8ntr8xl': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'jfc4amlc': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    's15v0mjl': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // PeopleAdded
  {
    'ex2twxp7': {
      'en': 'Users Updated!',
      'es': 'Usuarios actualizados!',
    },
    '8ezwyjd0': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // VideoUpload
  {
    '8cg0sqc8': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'a88i2h56': {
      'en': 'Please select an option below.',
      'es': 'Por favor, seleccione una opción a continuación.',
    },
    '4kkhx3pj': {
      'en': 'Videos',
      'es': 'Vídeos',
    },
    'mm743irb': {
      'en': 'Groups',
      'es': 'Grupos',
    },
    'ma2lrjez': {
      'en': 'Events',
      'es': 'Eventos',
    },
    '8r140w2v': {
      'en': 'Notes',
      'es': 'Notas',
    },
    'dw50bt48': {
      'en': 'Videos',
      'es': 'Vídeos',
    },
    'nzlqgfrm': {
      'en': 'Select if creating a new series',
      'es': '¿Hacer que este video sea destacado?',
    },
    'rnx5fn07': {
      'en': 'Add your thumbail photo here',
      'es': 'Agrega tu foto en miniatura aquí',
    },
    'nbocy337': {
      'en': 'Message Title',
      'es': 'Título del mensaje',
    },
    '6j3ijf82': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '12ixw795': {
      'en': 'Video URL',
      'es': 'URL del vídeo',
    },
    'ky1rtxd9': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'o87zli1g': {
      'en': 'Message Description',
      'es': 'Descripción del mensaje',
    },
    'ftvv4p96': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'f91z259z': {
      'en': 'Speaker',
      'es': 'Vocero',
    },
    'ye48ixz7': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '1m44ii08': {
      'en': 'Date',
      'es': 'Fecha',
    },
    'rq4tskue': {
      'en': 'xx/xx/xxxx',
      'es': 'xx/xx/xxxx',
    },
    't7p0l6ag': {
      'en': 'Video Length',
      'es': 'Duración del vídeo',
    },
    'yrc331w8': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'rd4fd0iy': {
      'en': 'Website Link',
      'es': 'Enlace de página web',
    },
    'o7rb5h5s': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'np3uk2nb': {
      'en': 'Make this video featured?',
      'es': '¿Hacer que este video sea destacado?',
    },
    '2jd7yolm': {
      'en': 'Recent Messages',
      'es': 'Mensajes recientes',
    },
    'n5wmtp0g': {
      'en': 'Recent Messages',
      'es': 'Mensajes recientes',
    },
    'b90omvd2': {
      'en': 'Resources',
      'es': 'Recursos',
    },
    'gkyf5gau': {
      'en': 'Announcements',
      'es': 'Anuncios',
    },
    'fidbk15g': {
      'en': 'Video Category...',
      'es': 'Categoría de vídeo...',
    },
    'vyvkvngp': {
      'en': 'Message Notes',
      'es': 'Notas del mensaje',
    },
    '3crfpu6s': {
      'en': 'Upload',
      'es': 'Subir',
    },
    'l8xnudgq': {
      'en': 'Upload Complete!',
      'es': 'Subir',
    },
    'ydjicmez': {
      'en': '*PDF format only.',
      'es': 'Subir',
    },
    'k2gxr8aw': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '5225mtzx': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'l9wbopgv': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'uwvzs4h4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'c3cbtubj': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'xj0o50bt': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '3n73e5q3': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'w1qrtf7l': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '95t92gig': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '88wdv2bw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'omvizr1p': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '8z6m1t87': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '1gvgb2dw': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '8itkqsdq': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ubdsifh1': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'aqi6zwjv': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '276bx8hk': {
      'en': 'Add your thumbail photo here',
      'es': 'Agrega tu foto en miniatura aquí',
    },
    'zrwzdaey': {
      'en': 'Series Title',
      'es': 'Título del mensaje',
    },
    'qa1cv8lo': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'aiim8vc7': {
      'en': 'Series Description',
      'es': 'Descripción del mensaje',
    },
    '40fs4bij': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '1bqtg9z2': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    'g9afrsoy': {
      'en': 'End Date',
      'es': 'Fecha final',
    },
    'r8mpx020': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'su9w5l7g': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'v3snnh8n': {
      'en': 'Field is required',
      'es': '',
    },
    'n73cukjh': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'udwzonqy': {
      'en': 'Field is required',
      'es': '',
    },
    'f2b4w7cl': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'wrwyfbwr': {
      'en': 'Add your group photo here (required)',
      'es': 'Añade tu foto de grupo aquí (obligatorio)',
    },
    'f0v9yw6u': {
      'en': 'Group Leaders',
      'es': 'Categoría',
    },
    '7sdpt9j2': {
      'en': 'Set',
      'es': 'Ver todo',
    },
    'kphkztse': {
      'en': 'Group Document',
      'es': 'Documento de grupo',
    },
    'e5034e33': {
      'en': 'Upload',
      'es': 'Subir',
    },
    '8r8wgso6': {
      'en': 'Group Name',
      'es': 'Nombre del grupo',
    },
    'e0sk409m': {
      'en': 'type here... (required)',
      'es': 'escriba aquí... (obligatorio)',
    },
    'hrc8q3go': {
      'en': 'Group Description',
      'es': 'Descripción del Grupo',
    },
    'jy7ssr3h': {
      'en': 'type here... (required)',
      'es': 'escriba aquí... (obligatorio)',
    },
    'xrar25qb': {
      'en': 'Category',
      'es': 'Categoría',
    },
    'kqnysles': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    'zxunmnln': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    'qqtkt7dr': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    '8ym2tj1l': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    'xq912f8v': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    'pc9xdqq3': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    '95paa5tx': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    'b5fesjoy': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    '6a2llvzu': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    'sku03n5l': {
      'en': 'Cat 5',
      'es': 'gato 5',
    },
    '920okhag': {
      'en': 'Cat 6',
      'es': 'gato 6',
    },
    'uub3595q': {
      'en': 'Cat 7',
      'es': 'gato 7',
    },
    'vzc0x7c5': {
      'en': 'Cat 8',
      'es': 'gato 8',
    },
    '57dod95n': {
      'en': 'Day of the Week',
      'es': 'Día de la semana',
    },
    'kkzz1yva': {
      'en': 'Monday',
      'es': 'Lunes',
    },
    'c1t10swt': {
      'en': 'Tuesday',
      'es': 'Martes',
    },
    '1s63nzdf': {
      'en': 'Wednesday',
      'es': 'Miércoles',
    },
    'pniaw417': {
      'en': 'Thursday',
      'es': 'Jueves',
    },
    '9sklsas0': {
      'en': 'Friday',
      'es': 'Viernes',
    },
    '5oeybqga': {
      'en': 'Saturday',
      'es': 'Sábado',
    },
    'sm00v2zg': {
      'en': 'Sunday',
      'es': 'Domingo',
    },
    '30rjyo85': {
      'en': 'Time of Day',
      'es': 'Hora del día',
    },
    '02vw53hx': {
      'en': 'Morning',
      'es': 'Mañana',
    },
    'p9fj6s2e': {
      'en': 'Midday',
      'es': 'Mediodía',
    },
    'o703piz5': {
      'en': 'Afternoon',
      'es': 'Tarde',
    },
    'ipr4mqem': {
      'en': 'Evening',
      'es': 'Noche',
    },
    'ijfi8voz': {
      'en': 'Age Range',
      'es': 'Rango de edad',
    },
    'mxxdt836': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    '26yf8sso': {
      'en': 'Elementary (1st-5th Grade)',
      'es': 'Primaria (1.º a 5.º grado)',
    },
    'dfsgolq8': {
      'en': 'Middle School (6th-8th Grade)',
      'es': 'Escuela Secundaria (6.º a 8.º grado)',
    },
    '71kbivit': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    'ps7z1fsu': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    'ztb0x13c': {
      'en': 'Young Adult  (25-30)',
      'es': 'Adulto joven (25-30)',
    },
    '7zm5nopv': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    '8s1g6m5n': {
      'en': 'Seniors (60+)',
      'es': 'Personas mayores (60+)',
    },
    'npi2c2er': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    'uu8m6ri2': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    'qb06lo2a': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    '9yr5jf9y': {
      'en': 'Gender',
      'es': 'Género',
    },
    'nv6785ba': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'us92xsdb': {
      'en': 'Female',
      'es': 'Femenino',
    },
    '4dsjwrjl': {
      'en': 'Make this group featured?',
      'es': '¿Hacer que este grupo aparezca?',
    },
    'pvh58tsi': {
      'en': 'Make this group private?',
      'es': '¿Hacer este grupo privado?',
    },
    'bcdd2dpv': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'md86025u': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    '9i270ng3': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'makg0mgt': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '6lllgjdh': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'k2h7j5wo': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '1uf57dgs': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'vdxzie9x': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'a1kac0go': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'cgpvx4s5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'mc2uois4': {
      'en': 'Add your event photo here',
      'es': 'Añade aquí la foto de tu evento',
    },
    'ls3ewr80': {
      'en': 'Event Title',
      'es': 'Título del evento',
    },
    '23c9ni7g': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'tmz0kykv': {
      'en': 'Website Link',
      'es': 'Enlace de página web',
    },
    'achujnd2': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'jhbf4fyc': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    '7vm1hgci': {
      'en': 'End Date',
      'es': 'Fecha final',
    },
    'ru5n1ke4': {
      'en': 'Make this event featured?',
      'es': '¿Hacer que este evento sea destacado?',
    },
    'jtwe0i44': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'o0sgi66f': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    '1rmwjkfr': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'dvy9frzm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ez954kia': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'k6reig0u': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'g8y7xbq9': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '3kiaume1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'hlst2o72': {
      'en': 'PDF Preview...',
      'es': 'Vista previa de PDF...',
    },
    'zd47upak': {
      'en': 'PDF Document',
      'es': 'Documento PDF',
    },
    'mp0r096m': {
      'en': 'Upload',
      'es': 'Subir',
    },
    'ga90t6gf': {
      'en': 'Upload complete!',
      'es': '¡Carga completa!',
    },
    '3wqzg8p7': {
      'en': ' Title',
      'es': 'Título',
    },
    'mcftlrcw': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'ghauulrn': {
      'en': 'Creator',
      'es': 'Creador',
    },
    'g4e5nl4y': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'ct8rix0e': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'f8g15dtk': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'izbemqmo': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '6hfkprw4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'tki8bzka': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'bw85c2zb': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ysu2uepa': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'wazr44t1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'pjaeokjj': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'chg7n611': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // VideoEdit
  {
    'l474bksd': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'asrzlxsz': {
      'en': 'Please edit your video below.',
      'es': 'Por favor, seleccione una opción a continuación.',
    },
    'u3sk4vog': {
      'en': 'Add your thumbail photo here',
      'es': 'Agrega tu foto en miniatura aquí',
    },
    'w3bavycn': {
      'en': 'Message Title',
      'es': 'Título del mensaje',
    },
    'p5xxymz4': {
      'en': 'Video URL',
      'es': 'URL del vídeo',
    },
    '4g1dgtb8': {
      'en': '',
      'es': 'escriba aquí...',
    },
    'moc859n1': {
      'en': 'Message Description',
      'es': 'Descripción del mensaje',
    },
    'b0e3i5vo': {
      'en': 'Speaker',
      'es': 'Vocero',
    },
    'tok3egfi': {
      'en': 'Date',
      'es': 'Fecha',
    },
    'wmmgtvpo': {
      'en': 'Video Length',
      'es': 'Duración del vídeo',
    },
    'dfe10068': {
      'en': 'Website Link',
      'es': 'Enlace de página web',
    },
    'flmay8ap': {
      'en': 'Recent Messages',
      'es': 'Mensajes recientes',
    },
    '707vxt3m': {
      'en': 'Resources',
      'es': 'Recursos',
    },
    'nnr3wlzy': {
      'en': 'Announcements',
      'es': 'Anuncios',
    },
    'r8kx26vj': {
      'en': 'Video Category...',
      'es': 'Categoría de vídeo...',
    },
    'o9ylak00': {
      'en': 'Message Notes',
      'es': 'Notas del mensaje',
    },
    'j4rtyzbf': {
      'en': 'Upload',
      'es': 'Subir',
    },
    'b7ct2mfs': {
      'en': 'Upload Complete!',
      'es': 'Subir',
    },
    'vamt02yu': {
      'en': 'Make this video featured?',
      'es': '¿Hacer que este video sea destacado?',
    },
    '20eztbnf': {
      'en': 'Delete Video',
      'es': 'Eliminar vídeo',
    },
    'mekqhtts': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'u50re3lg': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'yiqg8ye1': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'j0btons8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '9hymf5wh': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'pj90x0uk': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'kgwplar0': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'a94tc8oy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '5zck9fn1': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '1cqnxt5z': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'vlxg7xdv': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'hc3p7ej5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '596bqmu0': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '1cmiqmj3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '9bi72oii': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'lvvuvaeh': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // SeasonsUpdate
  {
    'z2hgq22g': {
      'en': '\"I\'m great!\"',
      'es': '\"¡Estoy genial!\"',
    },
    'tht74mgg': {
      'en': 'Update',
      'es': 'Actualizar',
    },
    'iww1s898': {
      'en': '\"\"I\'m okay.\"',
      'es': '\"\"Estoy bien.\"',
    },
    'vqo3low7': {
      'en': 'Update',
      'es': 'Actualizar',
    },
    'gj9uhfyp': {
      'en': '\"I\'ve been better...\"',
      'es': '\"He estado mejor...\"',
    },
    'bxtu67qf': {
      'en': 'Update',
      'es': 'Actualizar',
    },
    'wcp62702': {
      'en': '\"Not doing well.\"',
      'es': '\"No me va bien.\"',
    },
    'bd6nykuv': {
      'en': 'Update',
      'es': 'Actualizar',
    },
    'vbg71bh3': {
      'en': '\"I\'m hurting & frustrated.\"',
      'es': '\"Estoy dolido y frustrado\".',
    },
    '55pppgkf': {
      'en': 'Update',
      'es': 'Actualizar',
    },
    'i60rb44l': {
      'en': 'Custom Scripture',
      'es': 'Escritura personalizada',
    },
    'cv9nqoc6': {
      'en': 'Verse...',
      'es': 'Verso...',
    },
    '03d782ip': {
      'en': 'Type here...',
      'es': 'Escriba aquí...',
    },
    'b9wpc1pe': {
      'en': 'Verse Reference...',
      'es': 'Referencia del versículo...',
    },
    'g9fn46eq': {
      'en': 'Type here...',
      'es': 'Escriba aquí...',
    },
    'c4vl7vzp': {
      'en': 'Update',
      'es': 'Actualizar',
    },
  },
  // EditPracticeResponse2
  {
    'lhzqfkni': {
      'en': 'Edit your response',
      'es': 'Edita tu respuesta',
    },
    '5lqkqy37': {
      'en': 'Your response here...',
      'es': 'Tu respuesta aquí...',
    },
  },
  // EditPracticeResponse3
  {
    'qhy2ld0s': {
      'en': 'Edit your response',
      'es': 'Edita tu respuesta',
    },
    'phrw181t': {
      'en': 'Your response here...',
      'es': 'Tu respuesta aquí...',
    },
  },
  // EditPracticeResponse
  {
    'wrrhkzas': {
      'en': 'Edit your response',
      'es': 'Edita tu respuesta',
    },
    '4orkydwr': {
      'en': 'Your response here...',
      'es': 'Tu respuesta aquí...',
    },
  },
  // EditPracticeResponseCopy
  {
    'q21br0ea': {
      'en': 'Edit your response',
      'es': 'Edita tu respuesta',
    },
    'uva8fehg': {
      'en': 'Your response here...',
      'es': 'Tu respuesta aquí...',
    },
  },
  // GroupChatSettings
  {
    'ug8qjkbs': {
      'en': 'Chat Settings',
      'es': 'configuraciones de chat',
    },
    'rzy32cag': {
      'en': 'People',
      'es': 'Gente',
    },
    '3pbyhdru': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'z72ue819': {
      'en': 'Mute Conversation',
      'es': 'Silenciar Conversación',
    },
    'mxau1bxr': {
      'en':
          'This will disable all push notifications from this chat until toggled off.',
      'es':
          'Esto deshabilitará todas las notificaciones automáticas de este chat hasta que se desactive.',
    },
    'jlxlqryw': {
      'en': 'People',
      'es': 'Gente',
    },
    'qzmhh5a6': {
      'en': 'Add People',
      'es': 'Añadir personas',
    },
    'lcbyfhow': {
      'en': 'Group Update',
      'es': 'Actualización de grupo',
    },
    'jvpx3ovy': {
      'en': 'Update Background Photo',
      'es': 'Actualizar foto de fondo',
    },
    'g89yq1fh': {
      'en': 'Update Group Name',
      'es': 'Actualizar nombre de grupo',
    },
    'su9agy01': {
      'en': 'Delete Chat',
      'es': 'Eliminar chat',
    },
    'zuhyl2cm': {
      'en': 'Archive Chat',
      'es': 'Archivar chat',
    },
  },
  // GroupNameEdit
  {
    'zgnxnfne': {
      'en': 'Edit Group Name',
      'es': 'Editar nombre de grupo',
    },
  },
  // EditMessage
  {
    'uknlr30j': {
      'en': 'Edit your response',
      'es': 'Edita tu respuesta',
    },
    '8yr71q62': {
      'en': 'Your response here...',
      'es': 'Tu respuesta aquí...',
    },
    'l4d9nxcy': {
      'en': 'Delete?',
      'es': '¿Borrar?',
    },
    'wn6j9g4p': {
      'en': 'Remove Pin?',
      'es': '¿Quitar PIN?',
    },
    'k2y8zesw': {
      'en': 'Pin?',
      'es': '¿Alfiler?',
    },
  },
  // PDFViewer
  {
    'qig6imlr': {
      'en': 'PDF Viewer',
      'es': 'Visor de PDF',
    },
  },
  // PDFMessageNotes
  {
    '41x126sj': {
      'en': 'Message Notes',
      'es': 'Notas del mensaje',
    },
    '8h00v86s': {
      'en': 'No message notes have been \nuploaded for this video.',
      'es': '',
    },
  },
  // BadgeSheet
  {
    'pyf7h3r8': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // WorshipJournalsOther
  {
    'mdi1j0wp': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '9sz1jtvx': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'vqf3faji': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'ppodzzq9': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'jx7zb1l2': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    's58h8hoa': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    '9fu79vx5': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    '2tkfy80m': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'of8dbk99': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
  },
  // ScriptureJournalsOther
  {
    '86c6qw97': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    's3q7a663': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'rdpy6jcy': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    '7wogx8v8': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'esfozms2': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'y0sbeiei': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'teez41z7': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'wnhu6jr5': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'yd8h52ch': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
  },
  // PrayerJournalsOther
  {
    '2o1kb5iw': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'ritkbi25': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    'l3ipobx5': {
      'en': 'Newest',
      'es': 'El más nuevo',
    },
    '8tpri0b5': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    'wdfoutqq': {
      'en': 'Oldest',
      'es': 'Más antiguo',
    },
    '3oich8io': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'qu49cm97': {
      'en': 'Likes',
      'es': 'Gustos',
    },
    'zqas3paj': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'p49yl5vf': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
  },
  // EmptyStatePR
  {
    'k62lu55r': {
      'en': 'You don\'t have any prayer requests!',
      'es': '¡No tienes ninguna petición de oración!',
    },
    'u0vv2ptw': {
      'en':
          'Click the button in the top right corner to create a prayer request!',
      'es':
          '¡Haga clic en el botón en la esquina superior derecha para crear una petición de oración!',
    },
  },
  // EmptyStateJournals
  {
    '04cscx8g': {
      'en': 'No Journal Responses Yet!',
      'es': '¡Aún no hay respuestas de revistas!',
    },
    'y8rjyox6': {
      'en':
          'Create your own journal by responding to the prompt in the textfield below.',
      'es':
          'Cree su propio diario respondiendo al mensaje en el campo de texto a continuación.',
    },
  },
  // BadgeSheetPrayer
  {
    '89p9y87x': {
      'en': '',
      'es': '',
    },
    'stnh9z4h': {
      'en': 'Congratulations! You have unlocked the Prayer Badge!',
      'es': '¡Felicidades! ¡Has desbloqueado la Insignia de Oración!',
    },
    '6g4fg49m': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // BadgeSheet7
  {
    '7wv53gz5': {
      'en': '',
      'es': '',
    },
    'xptpmvnk': {
      'en': 'Congratulations! You have unlocked the One Week Badge!',
      'es': '¡Felicidades! ¡Has desbloqueado la insignia de una semana!',
    },
    'mdao8nhb': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // BadgeSheet30
  {
    'vkyk46i6': {
      'en': '',
      'es': '',
    },
    'rktnyu72': {
      'en': 'Congratulations! You have unlocked the 30 Days Badge!',
      'es': '¡Felicidades! ¡Has desbloqueado la insignia de 30 días!',
    },
    'j29dm6q7': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // BadgeSheet100
  {
    '47n2whjo': {
      'en': '',
      'es': '',
    },
    '0srdegla': {
      'en': 'Congratulations! You have unlocked the 100 Days Badge!',
      'es': '¡Felicidades! ¡Has desbloqueado la insignia de 100 días!',
    },
    '79skgj7p': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // BadgeSheet200
  {
    'u8djeso6': {
      'en': '',
      'es': '',
    },
    'q3uvjviv': {
      'en': 'Congratulations! You have unlocked the 200 Days Badge!',
      'es': '¡Felicidades! ¡Has desbloqueado la insignia de 200 días!',
    },
    'ct7wxilc': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // BadgeSheet365
  {
    '9mn78te1': {
      'en': '',
      'es': '',
    },
    'rvnl6fx9': {
      'en': 'Congratulations! You have unlocked the 365 Days Badge!',
      'es': '¡Felicidades! ¡Has desbloqueado la insignia de 365 días!',
    },
    '3edzmsw9': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // EmptystateFR
  {
    'xvpfsiu9': {
      'en': 'That\'s all! You don\'t have any \nmore friend requests.',
      'es': '¡Eso es todo! no tienes ninguno\nMás solicitudes de amistad.',
    },
  },
  // FriendRequests
  {
    'iml3pq0b': {
      'en': 'Friend Requests',
      'es': 'Peticiones de amistad',
    },
    '94o0pr18': {
      'en': 'Decline',
      'es': 'Rechazar',
    },
    'wf847d1a': {
      'en': 'Select',
      'es': 'Seleccionar',
    },
    'jvnjwznp': {
      'en': 'Accept',
      'es': 'Aceptar',
    },
    'iegel6is': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // FriendRequestSent
  {
    'i5zi1h8y': {
      'en': 'Friend request sent!',
      'es': '¡Solicitud de amistad enviada!',
    },
    'pgzrblab': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // PersonBlocked
  {
    'i7g0yyyk': {
      'en':
          'This person is blocked. You will not see any of their content and cannot have contact with them.',
      'es':
          'Esta persona ahora está bloqueada. No verá nada de su contenido y no podrán comunicarse con usted de ninguna manera.',
    },
    '2sntt6ni': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // FriendRemoved
  {
    'zspijjv5': {
      'en': 'Friend removed.',
      'es': 'Amigo eliminado.',
    },
    '56l1zb5j': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // FriendAccepted
  {
    'td5qm5my': {
      'en': 'Friend accepted!',
      'es': '¡Amigo aceptó!',
    },
    'qxeba4jg': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // FriendRequestDeclined
  {
    'h4g6ner3': {
      'en': 'Friend request declined.',
      'es': 'Solicitud de amistad rechazada.',
    },
    '1b874zyq': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // WorshipCreateFuture
  {
    '7abdxktz': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    'p38q84i9': {
      'en': 'Practice Title*',
      'es': 'Título de la práctica*',
    },
    '62hospk3': {
      'en': 'Video URL*',
      'es': 'URL del vídeo*',
    },
    'urndge7i': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    '4e9gkiii': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    's9am49mv': {
      'en': 'Practice Response Question*',
      'es': 'Pregunta de respuesta de práctica*',
    },
    'fqsdhp7b': {
      'en': 'Time Required',
      'es': 'Tiempo requerido',
    },
    '2spp5rns': {
      'en': 'Video Description',
      'es': 'Descripción del video',
    },
    'viqmej3d': {
      'en': 'Worship Video',
      'es': 'Vídeo de adoración',
    },
    'o6zvohhj': {
      'en': 'Worship Video',
      'es': 'Vídeo de adoración',
    },
    'ogty1m73': {
      'en': 'Scripture Video',
      'es': 'Vídeo de las Escrituras',
    },
    '5gr6s055': {
      'en': 'Prayer Video',
      'es': 'Vídeo de oración',
    },
    '0zdqchrg': {
      'en': 'Video Category...',
      'es': 'Categoría de vídeo...',
    },
    '9d0yb1ct': {
      'en': 'Launch Date',
      'es': 'Fecha de lanzamiento',
    },
    'bnm2u51t': {
      'en': '*These fields are required for journal \ncreation.',
      'es': '*Estos campos son obligatorios para la revista.\ncreación.',
    },
    '3o48kopk': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '345z5lm5': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'uciiahnk': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'cdo6hs6m': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '7dt1dazl': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '4v6uj2s1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'xpoa6d7l': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'fwsoibq7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ai6al6pl': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'ds00zbj8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '5ewq5gpy': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '95qfvjah': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'gkz1xdoi': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'zpprhp7m': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'shhrtw01': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '3g2x9ek4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // WorshipUpdateFuture
  {
    'wr3gvrji': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    'b54gza0l': {
      'en': 'Practice Title',
      'es': 'Título de la práctica',
    },
    '5z9f86qu': {
      'en': 'Video URL',
      'es': 'URL del vídeo',
    },
    'uy4b17wg': {
      'en': 'Practice Response Question',
      'es': 'Pregunta de respuesta de práctica',
    },
    'kwylzdyn': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    'g3cx7hbf': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    '7le8bfqq': {
      'en': 'Time Required',
      'es': 'Tiempo requerido',
    },
    '65sjke0t': {
      'en': 'Video Description',
      'es': 'Descripción del video',
    },
    'jwpx2ms2': {
      'en': 'Launch Date',
      'es': 'Fecha de lanzamiento',
    },
    'ofjbchb6': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'sabmtdlk': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // ScriptureUpdateFuture
  {
    'rmgqoalj': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    '0aj03h0b': {
      'en': 'Practice Title',
      'es': 'Título de la práctica',
    },
    'e8z6kj20': {
      'en': 'Video URL',
      'es': 'URL del vídeo',
    },
    '9ahp7xdc': {
      'en': 'Practice Response Question',
      'es': 'Pregunta de respuesta de práctica',
    },
    '0mk1i5gd': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    '3qmhu0jm': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    '4wbqwgw6': {
      'en': 'Time Required',
      'es': 'Tiempo requerido',
    },
    'h1lbqvpk': {
      'en': 'Video Description',
      'es': 'Descripción del video',
    },
    'iux7c2ar': {
      'en': 'Launch Date',
      'es': 'Fecha de lanzamiento',
    },
    'zz2hz7lx': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'oy5fbcm5': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // PrayerUpdateFuture
  {
    '883gmwbf': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    'ydg3m6kk': {
      'en': 'Practice Title',
      'es': 'Título de la práctica',
    },
    'q66ztqhg': {
      'en': 'Practice Title',
      'es': 'Título de la práctica',
    },
    '8mls90u9': {
      'en': 'Practice Response Question',
      'es': 'Pregunta de respuesta de práctica',
    },
    '8gfco49y': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    'yoqj6a1v': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    'h7krg5jg': {
      'en': 'Time Required',
      'es': 'Tiempo requerido',
    },
    'o178ptr0': {
      'en': 'Video Description',
      'es': 'Descripción del video',
    },
    'u1yna1ub': {
      'en': 'Launch Date',
      'es': 'Fecha de lanzamiento',
    },
    'u2fdv7qj': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'c26bryy2': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // CreateProfileTag
  {
    'vx07vkap': {
      'en': 'Enter the updated information below.',
      'es': 'Ingrese la información actualizada a continuación.',
    },
    '35kl1wjw': {
      'en': 'Tag Name',
      'es': 'Nombre de etiqueta',
    },
    'p4kysk0s': {
      'en': 'Tag Description',
      'es': 'Descripción de la etiqueta',
    },
    'yubmw8gn': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '6sh7negb': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // AddTag
  {
    'gr4ma6ab': {
      'en': 'Choose the tags you would like to add.',
      'es': 'Elija las etiquetas que le gustaría agregar.',
    },
    '4qo0byc8': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'tbzeboqs': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // GoingLive
  {
    'ldlko9p4': {
      'en': 'Do you want this to notify all of your users?',
      'es': '¿Quieres que esto notifique a todos tus usuarios?',
    },
    '2ehbar9h': {
      'en': 'No',
      'es': 'No',
    },
    '7agwvp2k': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // DeleteTag
  {
    'bz6o9vll': {
      'en': 'Delete this tag?',
      'es': '¿Eliminar esta etiqueta?',
    },
    'h41fle10': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'rjlmo65s': {
      'en': 'Delete',
      'es': 'Borrar',
    },
  },
  // addDate
  {
    'nsklczl6': {
      'en': 'Missing required data.',
      'es': 'Faltan datos requeridos.',
    },
    'epb3go1n': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // FeaturedNotificationVideos
  {
    '6zslg1o6': {
      'en': 'Do you want this to notify all of your users?',
      'es': '¿Quieres que esto notifique a todos tus usuarios?',
    },
    '32mg971x': {
      'en': 'No',
      'es': 'No',
    },
    'lt20ok9f': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // EmptyStateTags
  {
    'mhfe0x1o': {
      'en': 'No Tags Yet!',
      'es': '¡Aún no hay etiquetas!',
    },
    'ass1zxjf': {
      'en':
          'Create a tag through the \"Profile Tags\" option in your Admin Console.',
      'es':
          'Cree una etiqueta a través de la opción \"Etiquetas de perfil\" en su Consola de administración.',
    },
  },
  // DeleteChat
  {
    'kjezxcnl': {
      'en': 'Are you sure you want to delete this chat?',
      'es': '¿Estás seguro de que quieres eliminar este chat?',
    },
    'x7a0axrf': {
      'en': 'No',
      'es': 'No',
    },
    'gu3hgryr': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // ChatExists
  {
    'z5jdj3ys': {
      'en': 'You already have a chat with this user. Go to chat?',
      'es': 'Ya tienes un chat con este usuario. ¿Ir a charlar?',
    },
    'wa2497o1': {
      'en': 'No',
      'es': 'No',
    },
    'yfcvfbnf': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // PDFMessageNotesCopy
  {
    'u79fzl54': {
      'en': 'Message Notes',
      'es': 'Notas del mensaje',
    },
  },
  // readScripture
  {
    'c46hdiro': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    'jsmhxykk': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    'v18v4e19': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // CurrentPollChoosing
  {
    'y8oet0m7': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'grof09z8': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // ChatPollCreation
  {
    'nl02hzrd': {
      'en': 'Enter the poll information below.',
      'es': 'Ingrese la información de la encuesta a continuación.',
    },
    'ivugf730': {
      'en': 'Poll Name',
      'es': 'Nombre de la encuesta',
    },
    'w3dhk67q': {
      'en': 'Poll Description/Question',
      'es': 'Descripción de la encuesta/Pregunta',
    },
    '8ol139jd': {
      'en': 'Voting Options',
      'es': 'Opciones de votación',
    },
    'gnyk8yaj': {
      'en': 'Option A',
      'es': 'Opción A',
    },
    '09he5omh': {
      'en': 'Option B',
      'es': 'Opción B',
    },
    'ox7luizb': {
      'en': '+ Option',
      'es': '+ Opción',
    },
    '9jcpnsht': {
      'en': 'Option C (optional)',
      'es': 'Opción C (opcional)',
    },
    'fc2iqiiw': {
      'en': '+ Option',
      'es': '+ Opción',
    },
    'o2waaor7': {
      'en': 'Option D (optional)',
      'es': 'Opción D (opcional)',
    },
    'dym1t0at': {
      'en': '+ Option',
      'es': '+ Opción',
    },
    '33e0i2fn': {
      'en': 'Option E (optional)',
      'es': 'Opción E (opcional)',
    },
    'x24xknb6': {
      'en': 'Day to Run Poll',
      'es': 'Día para realizar la encuesta',
    },
    'fzg8sndb': {
      'en': 'Answers Public?',
      'es': '¿Respuestas públicas?',
    },
    '2kirdntn': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'evv418ul': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'd5m9vhc0': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'psq4yo6u': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ko5j7enm': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '7v30swy3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'l15ldmf7': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'kos7utvg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'tfcucpj1': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'mevawuio': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'dw9ntuxr': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'u7rosihm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '5s60w7m5': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '3iey1hzl': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'fqbtbxom': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'bz8e4jdk': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // CurrentPollViewing
  {
    'k772vh9o': {
      'en': 'Reset Poll Answers',
      'es': '¿Finalizar encuesta?',
    },
    'pa276cs2': {
      'en': 'End Poll?',
      'es': '¿Finalizar encuesta?',
    },
    '48312wxt': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // ChatExistsCopyCopy
  {
    'j9v895kw': {
      'en': 'Thank you for voting!',
      'es': 'Gracias por votar!',
    },
    'x7w4kg0b': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // answerNeeded
  {
    '91xfhrmr': {
      'en': 'You are missing a required step.',
      'es': 'Te falta un paso requerido.',
    },
    '6713qhba': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // ChatEventCreation
  {
    'lt62ab6x': {
      'en': 'Enter the event information below.',
      'es': 'Ingrese la información del evento a continuación.',
    },
    'cpk67uic': {
      'en': 'Event Name',
      'es': 'Nombre del evento',
    },
    'u1df0ad3': {
      'en': 'Event Description',
      'es': 'descripción del evento',
    },
    'y8ox4du5': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    '8hpq4i2z': {
      'en': 'End Date',
      'es': 'Fecha final',
    },
    'ms5ftsn9': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'bk38en71': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'lgufdlaz': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '5n4kom7d': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'pol7w3dy': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '2nrvic2c': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // DeleteChatPoll
  {
    'pvotvyte': {
      'en': 'Are you sure you want to delete this poll?',
      'es': '¿Estás seguro de que deseas eliminar esta encuesta?',
    },
    '04d3j104': {
      'en': 'No',
      'es': 'No',
    },
    '2dxjgjwb': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // ChatEventChoosing
  {
    'ncpxslwc': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    '6v9s43md': {
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    '4h8wczcs': {
      'en': 'X',
      'es': 'X',
    },
    '8g7rmaet': {
      'en': 'Decline',
      'es': 'Rechazar',
    },
    '894r9wzv': {
      'en': 'X',
      'es': 'X',
    },
    'w83w3glm': {
      'en': 'Decline',
      'es': 'Rechazar',
    },
    'w7txvyi2': {
      'en': '?',
      'es': '?',
    },
    'rg7tij4k': {
      'en': 'Maybe',
      'es': 'Tal vez',
    },
    '6mybeaxx': {
      'en': '?',
      'es': '?',
    },
    'f6cgozdv': {
      'en': 'Maybe',
      'es': 'Tal vez',
    },
    '0p8kez57': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'uow6awi0': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // ChatEventViewing
  {
    'elzzq0ch': {
      'en': 'Confirmed',
      'es': 'Confirmado',
    },
    'hd6s5bqk': {
      'en': 'Confirmed',
      'es': 'Confirmado',
    },
    '3sh5dk4b': {
      'en': 'X',
      'es': 'X',
    },
    'cfiislcc': {
      'en': 'Declined',
      'es': 'Rechazado',
    },
    'dgrp147z': {
      'en': 'X',
      'es': 'X',
    },
    'c6yj3x91': {
      'en': 'Declined',
      'es': 'Rechazado',
    },
    'okjl6jfq': {
      'en': '?',
      'es': '?',
    },
    '2772srfz': {
      'en': 'Maybe',
      'es': 'Tal vez',
    },
    '9f1dtads': {
      'en': '?',
      'es': '?',
    },
    '3ecb9a4b': {
      'en': 'Maybe',
      'es': 'Tal vez',
    },
    'jjzsxexs': {
      'en': 'X',
      'es': 'X',
    },
    'sr4aowv0': {
      'en': '?',
      'es': '?',
    },
    'hm8j5bs0': {
      'en': 'Delete Event?',
      'es': '¿Eliminar evento?',
    },
    'wwv5j3cr': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // DeleteChatPollCopy
  {
    'hj733zss': {
      'en': 'Are you sure you want to delete this event?',
      'es': '¿Estás seguro de que deseas eliminar este evento?',
    },
    'g9tdsyzp': {
      'en': 'No',
      'es': 'No',
    },
    'dbvysm9y': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // DeleteJournal
  {
    'peu24936': {
      'en': 'Are you sure you want to delete this journal?',
      'es': '¿Está seguro de que desea eliminar este diario?',
    },
    'fjlnye9o': {
      'en': 'No',
      'es': 'No',
    },
    'xt12jqik': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // DeleteVideo
  {
    'xa7uthz2': {
      'en': 'Are you sure you want to delete this video?',
      'es': '¿Estás seguro de que quieres eliminar este vídeo?',
    },
    '525f07j2': {
      'en': 'No',
      'es': 'No',
    },
    'biw5w0hc': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // LanguageSelectorBS
  {
    'dyhwcezl': {
      'en': 'Choose your language from the list below:',
      'es': 'Elija su idioma de la lista a continuación:',
    },
    'epp1lfnv': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // WorshipPracticeBS
  {
    'an5s8fih': {
      'en': 'Worship Journal Prompt',
      'es': 'Aviso del diario de adoración',
    },
    '7fvkrive': {
      'en': 'Responses',
      'es': 'Respuestas',
    },
    'qx4hw8z2': {
      'en': 'Completed!',
      'es': '¡Terminado!',
    },
    'fnj1vf3v': {
      'en': 'Write your response here',
      'es': 'Escribe tu respuesta aquí',
    },
    'zc097da8': {
      'en': 'Typing...',
      'es': 'Mecanografía...',
    },
    'piuhzysy': {
      'en': 'Top comments',
      'es': 'Top Comentarios',
    },
    'ist0r4wj': {
      'en': 'Newest first',
      'es': 'El más reciente primero',
    },
  },
  // ScripturePracticeBS
  {
    'cahi6pj4': {
      'en': 'Scripture Journal Prompt',
      'es': 'Aviso del diario de las Escrituras',
    },
    'w5gsobkw': {
      'en': 'Responses',
      'es': 'Respuestas',
    },
    'zgi0lyq6': {
      'en': 'Completed!',
      'es': '¡Terminado!',
    },
    'uuofbhja': {
      'en': 'Write your response here',
      'es': 'Escribe tu respuesta aquí',
    },
    'fzxjxuhz': {
      'en': 'Typing...',
      'es': 'Mecanografía...',
    },
    '67ddszdj': {
      'en': 'Top comments',
      'es': 'Top Comentarios',
    },
    'qe2f779r': {
      'en': 'Newest first',
      'es': 'El más reciente primero',
    },
  },
  // PrayerPracticeBS
  {
    'g3ccy7cl': {
      'en': 'Prayer Journal Prompt',
      'es': 'Aviso del diario de oración',
    },
    'lpb4twqz': {
      'en': 'Responses',
      'es': 'Respuestas',
    },
    '5qfwxj8v': {
      'en': 'Completed!',
      'es': '¡Terminado!',
    },
    'tw06y1y2': {
      'en': 'Write you response here',
      'es': 'Escribe tu respuesta aquí',
    },
    'p0suqd7z': {
      'en': 'Typing...',
      'es': 'Mecanografía...',
    },
    '10wgfv9h': {
      'en': 'Top comments',
      'es': 'Top Comentarios',
    },
    '2hxhy114': {
      'en': 'Newest first',
      'es': 'El más reciente primero',
    },
  },
  // readScriptureCopy
  {
    '3aq25p69': {
      'en': 'Scripture Reference',
      'es': 'Referencia de las Escrituras',
    },
    '45ign2em': {
      'en': 'Scripture Passage',
      'es': 'Pasaje de las Escrituras',
    },
    '8vqmfl2a': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // memberCount
  {
    'otpnly38': {
      'en': '+',
      'es': '+',
    },
    'x99y25lb': {
      'en': '0',
      'es': '0',
    },
    'v0gj771g': {
      'en': 'members',
      'es': 'miembros',
    },
  },
  // PeopleAddedGroup
  {
    'su2wwxo3': {
      'en': 'Users Updated!',
      'es': 'Usuarios actualizados!',
    },
    '02cwj2lg': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // GuidesEdit
  {
    'r2ddxqgl': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'bbpbx593': {
      'en': 'Please edit your fields below.',
      'es': 'Edite sus campos a continuación.',
    },
    'q9r149ll': {
      'en': 'PDF Preview...',
      'es': 'Vista previa de PDF...',
    },
    'g6ib0at5': {
      'en': 'PDF Document',
      'es': 'Documento PDF',
    },
    'ka1ysmk6': {
      'en': 'Upload',
      'es': 'Subir',
    },
    '5fhwegr1': {
      'en': 'Upload complete!',
      'es': '¡Carga completa!',
    },
    'qbdx7q5u': {
      'en': ' Title',
      'es': 'Título',
    },
    'fmm883to': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '8529eyyl': {
      'en': 'Description',
      'es': 'Descripción',
    },
    'taojygqa': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'mb9axf4z': {
      'en': 'Creator',
      'es': 'Creador',
    },
    '3gjfp6es': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'fk2we760': {
      'en': 'Website Link',
      'es': 'Enlace de página web',
    },
    'p3uqi6a7': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'akn6yp44': {
      'en': 'Delete Document',
      'es': 'Eliminar documento',
    },
    'ewx7t09e': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'zi78fu7w': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    '1yxdj77w': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'fbs47vj5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'gff5oysr': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'hqzl2aaa': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '1g7707f7': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'w8lrl314': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'fuap4lw9': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '77qtc78r': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'yi7divlg': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'xjnc5pr1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'o8ge8njf': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '0mfllbpf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '9mxlg1hw': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '1xwyi71t': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // EventEdit
  {
    'wobqbzt1': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '3jv5ghkw': {
      'en': 'Please edit your fields below.',
      'es': 'Edite sus campos a continuación.',
    },
    'onmk07t3': {
      'en': 'Add your event photo here',
      'es': 'Añade aquí la foto de tu evento',
    },
    'xc5b0nrl': {
      'en': 'Event Title',
      'es': 'Título del evento',
    },
    'gcdenrap': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    's2o4e0r7': {
      'en': 'Event Description',
      'es': 'descripción del evento',
    },
    'hhf3h7js': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'b29nd0yv': {
      'en': 'Date',
      'es': 'Fecha',
    },
    'ajlrgy71': {
      'en': 'xx/xx/xxxx',
      'es': 'xx/xx/xxxx',
    },
    'odc9ahvv': {
      'en': 'Website Link',
      'es': 'Enlace de página web',
    },
    '6ixubr1c': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'bicuhaa1': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    'hqbr015i': {
      'en': 'End Date',
      'es': 'Fecha final',
    },
    't0uo4l3e': {
      'en': 'Make this event featured?',
      'es': '¿Hacer que este evento sea destacado?',
    },
    'w9531uk9': {
      'en': 'Delete Event',
      'es': 'Eliminar evento',
    },
    'wxxhh1ag': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'n10azk23': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'etna447i': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'gknaw1vn': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'pwe0sciy': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'p2kr34mg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '0u4stx9e': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '5zuxuqq9': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '70cm98iq': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'gjtjw13a': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'mo8tftnm': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '3hgp7d1h': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '0b1hdq03': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '6h70j2ux': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'gl3884ko': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'dkcdwayy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // CustomPushNotification
  {
    '1pui4vnd': {
      'en': 'Customize your push noitification below.',
      'es': 'Personaliza tu notificación push a continuación.',
    },
    'jgsf4lqh': {
      'en': 'Add your photo here (optional)',
      'es': 'Añade tu foto aquí (opcional)',
    },
    'k81684y8': {
      'en': 'Notification Title...',
      'es': 'Título de la notificación...',
    },
    'qcxj0hon': {
      'en': 'Notification Text...',
      'es': 'Texto de notificación...',
    },
    'sm43d16p': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'kqw0wkn7': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '2eaw2uqq': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'b1duus8g': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '2uzqrjwf': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'mo0pysyi': {
      'en': 'Send',
      'es': 'Enviar',
    },
  },
  // FeaturedNotificationGroups
  {
    'nlonw6q1': {
      'en': 'Do you want this to notify all of your users?',
      'es': '¿Quieres que esto notifique a todos tus usuarios?',
    },
    'mrrnp2wk': {
      'en': 'No',
      'es': 'No',
    },
    '17169hp2': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // FeaturedNotificationEvents
  {
    'c1dix4p8': {
      'en': 'Do you want this to notify all of your users?',
      'es': '¿Quieres que esto notifique a todos tus usuarios?',
    },
    'srpacf6b': {
      'en': 'No',
      'es': 'No',
    },
    '2irtti2d': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // PeopleAddedTag
  {
    'rd8pm4t9': {
      'en': 'Users Updated!',
      'es': 'Usuarios actualizados!',
    },
    '8k6ry0a0': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // heartCheck
  {
    'yjrzv93c': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'xfhu652h': {
      'en': 'Please fill out your monthly heart check below.',
      'es': 'Complete su chequeo cardíaco mensual a continuación.',
    },
    'qzf81caq': {
      'en': 'How is my heart right now?',
      'es': '¿Cómo está mi corazón ahora?',
    },
    'kjdpntno': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'u68flmu0': {
      'en': 'How are my thoughts right now?',
      'es': '¿Cómo están mis pensamientos en este momento?',
    },
    'upnbokku': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'qilt4yv5': {
      'en': 'What are my motives right now?',
      'es': '¿Cuáles son mis motivos en este momento?',
    },
    'sdnp5415': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'ookbeacb': {
      'en': 'How am I feeling about my proximity to the Father right now?',
      'es':
          '¿Cómo me siento con respecto a mi proximidad al Padre en este momento?',
    },
    'jf8ctn1q': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    't854m57z': {
      'en': 'Has my soul grown or shrunk in the past 30 days?',
      'es': '¿Mi alma ha crecido o encogido en los últimos 30 días?',
    },
    'cnok3q9x': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'heu2mhqc': {
      'en': 'What can I start doing that I\'m not doing?',
      'es': '¿Qué puedo empezar a hacer que no estoy haciendo?',
    },
    'fmg9r291': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'vcispq6u': {
      'en': 'What can I stop doing that I\'m currently doing?',
      'es': '¿Qué puedo dejar de hacer que estoy haciendo actualmente?',
    },
    'n5goavp7': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'e8pwzcvz': {
      'en': 'Where am I spending my time?',
      'es': '¿Dónde paso mi tiempo?',
    },
    '9g48zt4x': {
      'en': 'selfish',
      'es': 'egoísta',
    },
    'gmsxacoi': {
      'en': 'selfless',
      'es': 'desinteresado',
    },
    'zvmgwj80': {
      'en': 'How am I using my talents?',
      'es': '¿Cómo estoy usando mis talentos?',
    },
    'nun9ezi5': {
      'en': 'selfish',
      'es': 'egoísta',
    },
    'vjl1qkmq': {
      'en': 'selfless',
      'es': 'desinteresado',
    },
    'y0l8dx7v': {
      'en': 'Where are my finances going?',
      'es': '¿A dónde van mis finanzas?',
    },
    'goc10ege': {
      'en': 'selfish',
      'es': 'egoísta',
    },
    '960sa889': {
      'en': 'selfless',
      'es': 'desinteresado',
    },
    'jyavb4wf': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '9w8jkied': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'sbjdedmz': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '7mceurqy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'miseq7zm': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'xstm6wp8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'v4idjpuo': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'ntewonp1': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'a3pszn66': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '15ely275': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '6g7gapvk': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'sc3z7tc6': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '7w0vn5sj': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'r300pn4t': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '3q8zk8c3': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '9e1jvydt': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'q6ynu5tu': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '2j0shyyr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // HeartCheckComplete
  {
    'cbai8o4n': {
      'en': 'Heart Check Complete!',
      'es': '¡Comprobación cardíaca completa!',
    },
    '154c8kcr': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // usersHeartCheck
  {
    'ofy2l4c8': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'g8w33v6e': {
      'en': 'How is my heart right now?',
      'es': '¿Cómo está mi corazón ahora?',
    },
    's90hvl2p': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '3sv57ie0': {
      'en': 'How are my thoughts right now?',
      'es': '¿Cómo están mis pensamientos en este momento?',
    },
    'rv0jw64r': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '8o4j8fh1': {
      'en': 'What are my motives right now?',
      'es': '¿Cuáles son mis motivos en este momento?',
    },
    'x34tcedr': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '7yp5zy9p': {
      'en': 'How am I feeling about my proximity to the Father right now?',
      'es':
          '¿Cómo me siento con respecto a mi proximidad al Padre en este momento?',
    },
    '2np76noo': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'v6z42jv2': {
      'en': 'Has my soul grown or shrunk in the past 30 days?',
      'es': '¿Mi alma ha crecido o encogido en los últimos 30 días?',
    },
    'b28dexbs': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'l9kch2zt': {
      'en': 'What can I start doing that I\'m not doing?',
      'es': '¿Qué puedo empezar a hacer que no estoy haciendo?',
    },
    '2151xkza': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    '59hom54h': {
      'en': 'What can I stop doing that I\'m currently doing?',
      'es': '¿Qué puedo dejar de hacer que estoy haciendo actualmente?',
    },
    'wmay4zas': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'kyt2gsyu': {
      'en': 'Where am I spending my time?',
      'es': '¿Dónde paso mi tiempo?',
    },
    'l7gzi9di': {
      'en': 'selfish',
      'es': 'egoísta',
    },
    'qxuwhpjo': {
      'en': 'selfless',
      'es': 'desinteresado',
    },
    'z5rbh3is': {
      'en': 'What does my journal say?',
      'es': '¿Qué dice mi diario?',
    },
    'i3ez2epg': {
      'en': 'selfish',
      'es': 'egoísta',
    },
    'vonatfee': {
      'en': 'selfless',
      'es': 'desinteresado',
    },
    'ulbfce0m': {
      'en': 'Where are my finances going?',
      'es': '¿A dónde van mis finanzas?',
    },
    'si566gaa': {
      'en': 'selfish',
      'es': 'egoísta',
    },
    '7kxarjqx': {
      'en': 'selfless',
      'es': 'desinteresado',
    },
    '8izp9uum': {
      'en': 'Back',
      'es': 'Atrás',
    },
    'o9zbt90q': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '71vcsswy': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '9zhgn9f1': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '1xysseaf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'bpvvdacn': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '0xyqm0si': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'we6l54dk': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'zr3vdsxc': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'p2g2aae8': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '0j22nf4j': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'xwyfmg45': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'whytbeko': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'gtqx4veq': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'cyc8pqng': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'h0k9ijth': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'v9vd9vra': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // GroupUploadOnly
  {
    '97mwlvx5': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '8gb9jcdh': {
      'en': 'Please enter your group details below.',
      'es': 'Por favor ingrese los detalles de su grupo a continuación.',
    },
    'wy8bhvg2': {
      'en': 'Add your group photo here (required)',
      'es': 'Añade tu foto de grupo aquí (obligatorio)',
    },
    'k8861zi6': {
      'en': 'Group Leaders',
      'es': 'Categoría',
    },
    'ff0j7uu1': {
      'en': 'Set',
      'es': 'Ver todo',
    },
    'p71lgde1': {
      'en': 'Group Document',
      'es': 'Documento de grupo',
    },
    'fp7506m7': {
      'en': 'Upload',
      'es': 'Subir',
    },
    'aajg5mh6': {
      'en': 'Group Name',
      'es': 'Nombre del grupo',
    },
    '9oc4wu18': {
      'en': 'type here... (required)',
      'es': 'escriba aquí... (obligatorio)',
    },
    'xxi8s08j': {
      'en': 'Group Description',
      'es': 'Descripción del Grupo',
    },
    'etyfy32w': {
      'en': 'type here... (required)',
      'es': 'escriba aquí... (obligatorio)',
    },
    'ts0fbalq': {
      'en': 'Category',
      'es': 'Categoría',
    },
    '0emajh0w': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    'nask5y5g': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    'q02mbuim': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    'vdp2uotp': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    'q08uoqzc': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    '277hv8e3': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    'lmsjjvt0': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    'ujysdrps': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    '836th5ch': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    'zqk8lq23': {
      'en': 'Cat 5',
      'es': 'gato 5',
    },
    'i8zan51h': {
      'en': 'Cat 6',
      'es': 'gato 6',
    },
    '72znc3x2': {
      'en': 'Cat 7',
      'es': 'gato 7',
    },
    '5an3da5o': {
      'en': 'Cat 8',
      'es': 'gato 8',
    },
    'lvudyact': {
      'en': 'Day of the Week',
      'es': 'Día de la semana',
    },
    'elx8v5ke': {
      'en': 'Monday',
      'es': 'Lunes',
    },
    'k8khuoc1': {
      'en': 'Tuesday',
      'es': 'Martes',
    },
    'eqbll8pu': {
      'en': 'Wednesday',
      'es': 'Miércoles',
    },
    'wbonrvbk': {
      'en': 'Thursday',
      'es': 'Jueves',
    },
    '371x1rwa': {
      'en': 'Friday',
      'es': 'Viernes',
    },
    'w4ah64zj': {
      'en': 'Saturday',
      'es': 'Sábado',
    },
    'gk2ffuw1': {
      'en': 'Sunday',
      'es': 'Domingo',
    },
    'yswca20r': {
      'en': 'Time of Day',
      'es': 'Hora del día',
    },
    'zih1i1k3': {
      'en': 'Morning',
      'es': 'Mañana',
    },
    'azrz2a4h': {
      'en': 'Midday',
      'es': 'Mediodía',
    },
    'zcvcp4kn': {
      'en': 'Afternoon',
      'es': 'Tarde',
    },
    'e1e6yucp': {
      'en': 'Evening',
      'es': 'Noche',
    },
    'zcsviyl6': {
      'en': 'Age Range',
      'es': 'Rango de edad',
    },
    'bs9kb1do': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    'h8usw999': {
      'en': 'Elementary (1st-5th Grade)',
      'es': 'Primaria (1.º a 5.º grado)',
    },
    'iypa8sqj': {
      'en': 'Middle School (6th-8th Grade)',
      'es': 'Escuela Secundaria (6.º a 8.º grado)',
    },
    'a946t0p5': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    'a9aeqyad': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    'pupfuall': {
      'en': 'Young Adult  (25-30)',
      'es': 'Adulto joven (25-30)',
    },
    'xwyrxiov': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    'yh1kwd62': {
      'en': 'Seniors (60+)',
      'es': 'Personas mayores (60+)',
    },
    'oqmhh4rn': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    'm8fh4u3x': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    'zhfm4wli': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    'uc1vv2qm': {
      'en': 'Gender',
      'es': 'Género',
    },
    '02q38j0n': {
      'en': 'Male',
      'es': 'Masculino',
    },
    '3eblr2yi': {
      'en': 'Female',
      'es': 'Femenino',
    },
    'dyzxe9wj': {
      'en': 'Make this group featured?',
      'es': '¿Hacer que este grupo aparezca?',
    },
    'ywtnen2e': {
      'en': 'Make this group private?',
      'es': '¿Hacer este grupo privado?',
    },
    'g7xsgvah': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '7jb8i8dg': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'qjf136g4': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'djdmeu26': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'u3m5bm6p': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '2q13avzr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // groupFilter
  {
    'n84sxn8q': {
      'en': 'Filter',
      'es': 'Filtrar',
    },
    '2aef2oya': {
      'en': 'Reset',
      'es': 'Reiniciar',
    },
    'j8q46niz': {
      'en': 'Category',
      'es': 'Categoría',
    },
    'niafwkwf': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    '2pfjsnb7': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    '63bem7e7': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    'qrdpuwd5': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    '8i8lt4kc': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    'iy45lnsl': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    'd3gbhou9': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    '01ptgduj': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    '0zku92ng': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    'aowa1pab': {
      'en': 'Cat 5',
      'es': 'gato 5',
    },
    'c1bs6i9b': {
      'en': 'Cat 6',
      'es': 'gato 6',
    },
    'gb1b5u77': {
      'en': 'Cat 7',
      'es': 'gato 7',
    },
    '7g1f65gw': {
      'en': 'Cat 8',
      'es': 'gato 8',
    },
    'n8pt5akt': {
      'en': 'Day of the Week',
      'es': 'Día de la semana',
    },
    'dobojq9h': {
      'en': 'Monday',
      'es': 'Lunes',
    },
    'd338oox1': {
      'en': 'Tuesday',
      'es': 'Martes',
    },
    '1pd8rju4': {
      'en': 'Wednesday',
      'es': 'Miércoles',
    },
    'wvw7ekgv': {
      'en': 'Thursday',
      'es': 'Jueves',
    },
    'lalpgc6k': {
      'en': 'Friday',
      'es': 'Viernes',
    },
    'v9gz49qj': {
      'en': 'Saturday',
      'es': 'Sábado',
    },
    't6f06zvb': {
      'en': 'Sunday',
      'es': 'Domingo',
    },
    '8wpthkd8': {
      'en': 'Time of Day',
      'es': 'Hora del día',
    },
    'hsmo0h6j': {
      'en': 'Morning',
      'es': 'Mañana',
    },
    '7sg1vsrb': {
      'en': 'Midday',
      'es': 'Mediodía',
    },
    's164bwfk': {
      'en': 'Afternoon',
      'es': 'Tarde',
    },
    'zzvkkd1x': {
      'en': 'Evening',
      'es': 'Noche',
    },
    '4uzf25g3': {
      'en': 'Age Range',
      'es': 'Rango de edad',
    },
    'xehyxr72': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    'kg3sffnn': {
      'en': 'Elementary (1st-5th Grade)',
      'es': 'Primaria (1.º a 5.º grado)',
    },
    'd5gnlf5z': {
      'en': 'Middle School (6th-8th Grade)',
      'es': 'Escuela Secundaria (6.º a 8.º grado)',
    },
    '5ip6uy9y': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    '4mcpkz44': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    '86qvwg60': {
      'en': 'Young Adult  (25-30)',
      'es': 'Adulto joven (25-30)',
    },
    'cadyw5ws': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    'xfs6gin5': {
      'en': 'Seniors (60+)',
      'es': 'Personas mayores (60+)',
    },
    '2tbjlitt': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    'gyrkdj8b': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    'dxn2n639': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    'kzo0nkt9': {
      'en': 'Gender',
      'es': 'Género',
    },
    '70tnadc6': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'srjptmf8': {
      'en': 'Female',
      'es': 'Femenino',
    },
    '7kv2knxh': {
      'en': 'Show Results',
      'es': 'Mostrar resultados',
    },
  },
  // GroupRating
  {
    'vx9saupb': {
      'en': 'Specific Feedback',
      'es': 'Comentarios específicos',
    },
    'd99u57ka': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'jtchxkdj': {
      'en': 'Thank you for your feedback!',
      'es': '¡Gracias por tus comentarios!',
    },
    '6dutghka': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'zt9olpef': {
      'en': 'Field is required',
      'es': '',
    },
    'eyej3m8u': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
  },
  // GroupEdit
  {
    'yr0iws62': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'vglakeec': {
      'en': 'Please edit your fields below.',
      'es': 'Edite sus campos a continuación.',
    },
    '8twt6ql7': {
      'en': 'Add your group photo here (required)',
      'es': 'Añade tu foto de grupo aquí (obligatorio)',
    },
    '7p3a1nc2': {
      'en': 'Group Leaders',
      'es': 'Categoría',
    },
    '5ukpaoay': {
      'en': 'Set',
      'es': 'Ver todo',
    },
    'vhmcpym8': {
      'en': 'You must reset leaders whenever you edit this group.',
      'es': '',
    },
    'a64wadsz': {
      'en': 'Group Document',
      'es': 'Documento de grupo',
    },
    'a4ux2ne6': {
      'en': 'Upload',
      'es': 'Subir',
    },
    'h2inp11n': {
      'en': 'Group Name',
      'es': 'Nombre del grupo',
    },
    'hnx1dynf': {
      'en': 'Group Description',
      'es': 'Descripción del Grupo',
    },
    'ptn8ugzf': {
      'en': 'Category',
      'es': 'Categoría',
    },
    '23kuf451': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    '4f09aqdv': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    '3uqnr34m': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    'pw4qtl2f': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    'q3dqzmwi': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    'rrsadvuw': {
      'en': 'Cat 5',
      'es': 'gato 5',
    },
    'kufs5a9v': {
      'en': 'Cat 6',
      'es': 'gato 6',
    },
    'av9zq90w': {
      'en': 'Cat 7',
      'es': 'gato 7',
    },
    '8c21hotw': {
      'en': 'Cat 8',
      'es': 'gato 8',
    },
    '8tzqh0rk': {
      'en': 'Cat 1',
      'es': 'Gato 1',
    },
    '39k35la5': {
      'en': 'Cat 2',
      'es': 'gato 2',
    },
    'xpcvp597': {
      'en': 'Cat 3',
      'es': 'gato 3',
    },
    'nyzp0jx0': {
      'en': 'Cat 4',
      'es': 'gato 4',
    },
    '3owgmqh5': {
      'en': 'Day of the Week',
      'es': 'Día de la semana',
    },
    'f3imt59s': {
      'en': 'Monday',
      'es': 'Lunes',
    },
    'aktrbow9': {
      'en': 'Tuesday',
      'es': 'Martes',
    },
    'ki7se90t': {
      'en': 'Wednesday',
      'es': 'Miércoles',
    },
    '2hg9j7kf': {
      'en': 'Thursday',
      'es': 'Jueves',
    },
    'opb30ysa': {
      'en': 'Friday',
      'es': 'Viernes',
    },
    'hyi9ddqh': {
      'en': 'Saturday',
      'es': 'Sábado',
    },
    'l90ujdg3': {
      'en': 'Sunday',
      'es': 'Domingo',
    },
    '4p1rbe36': {
      'en': 'Time of Day',
      'es': 'Hora del día',
    },
    '68f4ltxt': {
      'en': 'Morning',
      'es': 'Mañana',
    },
    'ui9h92tv': {
      'en': 'Midday',
      'es': 'Mediodía',
    },
    '9nv89l6q': {
      'en': 'Afternoon',
      'es': 'Tarde',
    },
    'd2a7mx47': {
      'en': 'Evening',
      'es': 'Noche',
    },
    'h6ywu4e4': {
      'en': 'Age Range',
      'es': 'Rango de edad',
    },
    '64z3cqip': {
      'en': 'View all',
      'es': 'Ver todo',
    },
    'ezzymthe': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    'sov4gcch': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    'rdmtqiul': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    's93o652g': {
      'en': 'Elementary (1st-5th Grade)',
      'es': 'Primaria (1.º a 5.º grado)',
    },
    'llz3r075': {
      'en': 'Middle School (6th-8th Grade)',
      'es': 'Escuela Secundaria (6.º a 8.º grado)',
    },
    'xvhnonwv': {
      'en': 'High School (9th-12th Grade)',
      'es': 'Escuela secundaria (grados 9.º a 12.º)',
    },
    'mbacwflu': {
      'en': 'College (18-25)',
      'es': 'Universidad (18-25)',
    },
    '3lbrijdu': {
      'en': 'Young Adult  (25-30)',
      'es': 'Adulto joven (25-30)',
    },
    'cralpidz': {
      'en': 'Adult (30-60)',
      'es': 'Adulto (30-60)',
    },
    '10qt2t2f': {
      'en': 'Seniors (60+)',
      'es': 'Personas mayores (60+)',
    },
    '1xub9f5i': {
      'en': 'Gender',
      'es': 'Género',
    },
    'da99cih3': {
      'en': 'Male',
      'es': 'Masculino',
    },
    '322iy4l7': {
      'en': 'Female',
      'es': 'Femenino',
    },
    '1joo3i3i': {
      'en': 'Make this group featured?',
      'es': '¿Hacer que este grupo aparezca?',
    },
    'p4uixvr3': {
      'en': 'Make this group private?',
      'es': '¿Hacer este grupo privado?',
    },
    'r80a8pg2': {
      'en': 'Delete Group',
      'es': 'Eliminar grupo',
    },
    'q8umnzh1': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '6pdsrwvp': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'la59m5jb': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'olrapqfx': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '8spy7i8q': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'lq17rhfz': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'k5yy74n7': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    '9scwl86g': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ibmgzo6k': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'gblv97yc': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // groupRatingDisplay
  {
    '7efq4gtu': {
      'en': 'Specific Feedback',
      'es': 'Comentarios específicos',
    },
    'tmsfuf2v': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
  },
  // DeleteGroup
  {
    '6hztnx1h': {
      'en': 'Are you sure you want to delete this group?',
      'es': '¿Estás seguro de que deseas eliminar este grupo?',
    },
    'ckremzph': {
      'en': 'No',
      'es': 'No',
    },
    'hm4msrmf': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // DeleteEvent
  {
    '4btfapst': {
      'en': 'Are you sure you want to delete this event?',
      'es': '¿Estás seguro de que deseas eliminar este evento?',
    },
    'i8cnhgdy': {
      'en': 'No',
      'es': 'No',
    },
    '9p6noj3l': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // DeleteNotes
  {
    'e62o6vpy': {
      'en': 'Are you sure you want to delete this document?',
      'es': '¿Está seguro de que desea eliminar este documento?',
    },
    '3lozhiz5': {
      'en': 'No',
      'es': 'No',
    },
    '6hgev7a9': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // addGuest
  {
    'hfw6lb6m': {
      'en': 'Guest\'s Name',
      'es': 'Comentarios específicos',
    },
    '9mh88pzy': {
      'en': '',
      'es': 'escriba aquí...',
    },
    '1vsoapxm': {
      'en': 'Guest\'s Phone Number',
      'es': 'Comentarios específicos',
    },
    'yicqjhjn': {
      'en': '',
      'es': 'escriba aquí...',
    },
    'd9dkblx2': {
      'en': 'Guest\'s Age',
      'es': 'Comentarios específicos',
    },
    'brvno4ta': {
      'en': '',
      'es': 'escriba aquí...',
    },
    '4jz4h839': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // under13
  {
    'ai374de1': {
      'en':
          'A member of this chat is 13 or under. You must be on their friends list to start a chat.',
      'es':
          'Un miembro de este chat tiene 13 años o menos. Debes estar en su lista de amigos para iniciar un chat.',
    },
    'a10dq52g': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // languageReport
  {
    'ebbsr7mv': {
      'en':
          'We have detected innapropriate language in your text. Please adjust your text before submitting.',
      'es':
          'Hemos detectado lenguaje inadecuado en su texto. Por favor ajuste su texto antes de enviarlo.',
    },
    'gke7ezfw': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // TC
  {
    '2n5xhx5q': {
      'en':
          'You must accept our terms and conditions before creating an account.',
      'es':
          'Debe aceptar nuestros términos y condiciones antes de crear una cuenta.',
    },
    '5xjcn968': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // DeleteAccount
  {
    'cwajngu2': {
      'en': 'Are you sure you want to delete your account?',
      'es': '¿Estás seguro de que quieres eliminar tu cuenta?',
    },
    '9dz860xd': {
      'en': 'No',
      'es': 'No',
    },
    'vn1m2ymf': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // reportConcern
  {
    'ih6f0dbc': {
      'en': 'Report a Concern',
      'es': 'Informar una inquietud',
    },
    'qewufaj7': {
      'en': 'Details about the offensive behavior...',
      'es': 'Detalles sobre el comportamiento ofensivo...',
    },
    'uw1tk3cb': {
      'en': 'Please do not provide any personal or sensitive information.',
      'es': 'Por favor no proporcione ninguna información personal o sensible.',
    },
    '4jwyiqn5': {
      'en': ' Privacy Policy',
      'es': 'política de privacidad',
    },
    '4i6dde08': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'e77vdgb1': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'yn4h9qmr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // blockConfirmation
  {
    'rqhimlxq': {
      'en': 'Are you sure you want to block this person?',
      'es': '¿Estás seguro que quieres bloquear a esta persona?',
    },
    'uo3rwdnh': {
      'en': 'No',
      'es': 'No',
    },
    '4o47tnrp': {
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // NotificationSent
  {
    'q28sgz2j': {
      'en': 'Notification sent!',
      'es': '¡Notificación enviada!',
    },
    'rvh7sxeo': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // JournalArchiveBS
  {
    'hwwc5lez': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    'x7eyt0ig': {
      'en': 'Choose an option below to view your journal archives!',
      'es':
          '¡Elija una de las siguientes opciones para ver los archivos de su revista!',
    },
    'tcef81ii': {
      'en': 'Worship Journals',
      'es': 'Diarios de adoración',
    },
    'x30kjx09': {
      'en': 'Scripture Journals',
      'es': 'Diarios de las Escrituras',
    },
    'yi17ol5r': {
      'en': 'Prayer Journals',
      'es': 'Diarios de oración',
    },
  },
  // welcomeToChurch
  {
    'xy1ifsdm': {
      'en': 'Welcome to church! We hope you enjoy your experience today!',
      'es':
          'Debe aceptar nuestros términos y condiciones antes de crear una cuenta.',
    },
    'wfgwmcy9': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // addedToSeries
  {
    '737rshwz': {
      'en': 'Video has been added to this series!',
      'es': 'Usuarios actualizados!',
    },
    'zlfm8er0': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // videoSeriesEdit
  {
    '768i50jd': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
    '8qp2tib0': {
      'en': 'Please edit your video below.',
      'es': 'Por favor, seleccione una opción a continuación.',
    },
    'k9z96f79': {
      'en': 'Add your thumbail photo here',
      'es': 'Agrega tu foto en miniatura aquí',
    },
    'i1j4e4r7': {
      'en': 'Series Title',
      'es': 'Título del mensaje',
    },
    '771zv2iq': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'yfdv9uvo': {
      'en': 'Series Description',
      'es': 'Descripción del mensaje',
    },
    'n52sb0o2': {
      'en': 'type here...',
      'es': 'escriba aquí...',
    },
    'vkpoo7uy': {
      'en': 'Start Date',
      'es': 'Fecha de inicio',
    },
    'cjg3aeju': {
      'en': 'End Date',
      'es': 'Fecha final',
    },
    'j7zuaoyp': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '3na5dhew': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    '6c7rns2n': {
      'en': 'Field is required',
      'es': '',
    },
    'pytq7fvu': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'iobzj1x5': {
      'en': 'Field is required',
      'es': '',
    },
    'grbh3lfc': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
  },
  // communityPrayerRequest
  {
    'dvgl517f': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'yocfnn9z': {
      'en': 'Pinned by Admin',
      'es': '¡Oración respondida!',
    },
    'uw2rfvve': {
      'en': '+',
      'es': '+',
    },
    'throj6wo': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    '0e8xaodr': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'g26jpszr': {
      'en': 'Pinned by Admin',
      'es': '¡Oración respondida!',
    },
    'ffggpwgt': {
      'en': '+',
      'es': '+',
    },
    'fl08a3ra': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    'xtpshi4v': {
      'en': 'Pray',
      'es': 'Orar',
    },
    '4uh0cl1r': {
      'en': 'Message',
      'es': 'Mensaje',
    },
    'al6v3w0u': {
      'en': 'Mark Answered',
      'es': 'Marcos respondió',
    },
    '6pw7z0j9': {
      'en': 'Unmark Answered',
      'es': 'Desmarcar Respondido',
    },
    'own91fl6': {
      'en': 'Share',
      'es': 'Compartir',
    },
    'nvwdvbuo': {
      'en': 'Pin',
      'es': 'Editar',
    },
    'p2ig5ewk': {
      'en': 'Unpin',
      'es': 'Editar',
    },
    't6sq841g': {
      'en': 'Edit',
      'es': 'Editar',
    },
  },
  // personalPrayerRequest
  {
    '9jtvyi19': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'x5zoabav': {
      'en': '+',
      'es': '+',
    },
    'kqj1k2oy': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    '2r63xvdc': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'n6gffzsz': {
      'en': '+',
      'es': '+',
    },
    'qpirnvt1': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    'lajpqlog': {
      'en': 'Pray',
      'es': 'Orar',
    },
    'dqb7m0d3': {
      'en': 'Mark Answered',
      'es': 'Marcos respondió',
    },
    'gv2hos8z': {
      'en': 'Unmark Answered',
      'es': 'Desmarcar Respondido',
    },
    'c110rtej': {
      'en': 'Edit',
      'es': 'Editar',
    },
  },
  // journalPreview
  {
    'eof79vky': {
      'en': 'Open Journal',
      'es': 'Diario abierto',
    },
  },
  // PracticePreview
  {
    'wkjkujrd': {
      'en': 'DUPLICATE',
      'es': 'BORRAR',
    },
    '0aughecz': {
      'en': 'UPDATE',
      'es': 'ACTUALIZAR',
    },
  },
  // journalResponsePreview
  {
    'm191w3ax': {
      'en': 'Reply',
      'es': 'Responder',
    },
    '5mbcgtft': {
      'en': 'Edit',
      'es': 'Editar',
    },
    '8cprnopx': {
      'en': 'Reply',
      'es': 'Responder',
    },
    'n0t7etd7': {
      'en': 'Replies',
      'es': 'Respuestas',
    },
    'k35sqhjq': {
      'en': 'Edit',
      'es': 'Editar',
    },
  },
  // practiceJournalPreview
  {
    'iukjur6g': {
      'en': 'Worship',
      'es': 'Culto',
    },
    '36gzfiix': {
      'en': 'Scripture',
      'es': 'Sagrada Escritura',
    },
    '2dpqw4ej': {
      'en': 'Prayer',
      'es': 'Oración',
    },
    'aw8cn4uc': {
      'en': 'START',
      'es': 'COMENZAR',
    },
    'qmhcu20d': {
      'en': 'SHARE',
      'es': 'COMPARTIR',
    },
  },
  // videoDetailsBS
  {
    'txh8qtjm': {
      'en': '+',
      'es': '+',
    },
    '1drjccmg': {
      'en': '0',
      'es': '0',
    },
    'f76pj7pj': {
      'en': ' have watched!',
      'es': '¡Han completado!',
    },
    '9s09u7y6': {
      'en': 'Message Notes',
      'es': 'Ver ahora',
    },
  },
  // RatingReceived
  {
    '7cirneel': {
      'en': 'Thank you for rating!',
      'es': '¡Gracias por asistir!',
    },
    '9g8fd9dt': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // CreatePrayerChat
  {
    'cjnz1l3m': {
      'en': 'Create a private prayer request for your group.',
      'es': '',
    },
    'c6ns6dnk': {
      'en': 'Create Prayer Request...',
      'es': 'Crear solicitud de oración...',
    },
    'rsqhbau3': {
      'en': 'Write your prayer requests here...',
      'es': 'Escribe aquí tus peticiones de oración...',
    },
    '6w2111a7': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '462nqqqb': {
      'en': 'Submit',
      'es': 'Entregar',
    },
  },
  // communityPrayerRequestChat
  {
    'cdf33bjp': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'kp9xlmlk': {
      'en': '+',
      'es': '+',
    },
    'ikcqu8io': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    'uwwjkfkf': {
      'en': 'Prayer Answered!',
      'es': '¡Oración respondida!',
    },
    'r69zjahw': {
      'en': '+',
      'es': '+',
    },
    '2vt0g1td': {
      'en': 'prayed so far',
      'es': 'orado hasta ahora',
    },
    '5cu5heda': {
      'en': 'Pray',
      'es': 'Orar',
    },
    'lboak7m3': {
      'en': 'Message',
      'es': 'Mensaje',
    },
    'mmrw68bw': {
      'en': 'Reply',
      'es': 'Compartir',
    },
    'woj97qxh': {
      'en': 'Mark Answered',
      'es': 'Marcos respondió',
    },
    'qwjbt1hp': {
      'en': 'Unmark Answered',
      'es': 'Desmarcar Respondido',
    },
    'ooedgliu': {
      'en': 'Edit',
      'es': 'Editar',
    },
  },
  // EditPrayerChat
  {
    'iwqkuqy4': {
      'en': 'Edit the prayer request for your group.',
      'es': '',
    },
    'uup82fy4': {
      'en': 'Edit Prayer Request',
      'es': 'Editar solicitud de oración',
    },
    '265k5cld': {
      'en': 'Delete',
      'es': 'Borrar',
    },
    'gsqcwo2w': {
      'en': 'Update',
      'es': 'Actualizar',
    },
  },
  // GroupLeadersSet
  {
    '5kq0lugy': {
      'en':
          'You must set the group leaders before creating or editing a group.',
      'es':
          'Debe aceptar nuestros términos y condiciones antes de crear una cuenta.',
    },
    'jebhkc3o': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // MoreMembersNeeded
  {
    'ilv717ki': {
      'en': 'This group needs more than one member to start a chat.',
      'es':
          'Debe aceptar nuestros términos y condiciones antes de crear una cuenta.',
    },
    'ee8prv17': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // PrayerPracticeBSall
  {
    '5q6n86fi': {
      'en': 'Prayer Journal Prompt',
      'es': 'Aviso del diario de oración',
    },
    'ofuiybqx': {
      'en': 'Responses',
      'es': 'Respuestas',
    },
    '29def6pu': {
      'en': 'Completed!',
      'es': '¡Terminado!',
    },
    'ohgodgk6': {
      'en': 'Write you response here',
      'es': 'Escribe tu respuesta aquí',
    },
    'dxdu44g3': {
      'en': 'Typing...',
      'es': 'Mecanografía...',
    },
    'uwruqab4': {
      'en': 'Top comments',
      'es': 'Top Comentarios',
    },
    'tcc52ovj': {
      'en': 'Newest first',
      'es': 'El más reciente primero',
    },
  },
  // WorshipPracticeBSall
  {
    '6vy9l7db': {
      'en': 'Worship Journal Prompt',
      'es': 'Aviso del diario de adoración',
    },
    '61fjwuij': {
      'en': 'Responses',
      'es': 'Respuestas',
    },
    'qp1t3esn': {
      'en': 'Completed!',
      'es': '¡Terminado!',
    },
    '0teeqv52': {
      'en': 'Write your response here',
      'es': 'Escribe tu respuesta aquí',
    },
    'fyxt5n4h': {
      'en': 'Typing...',
      'es': 'Mecanografía...',
    },
    'daiw891o': {
      'en': 'Top comments',
      'es': 'Top Comentarios',
    },
    'qfa1d968': {
      'en': 'Newest first',
      'es': 'El más reciente primero',
    },
  },
  // ScripturePracticeBSall
  {
    'd76tyx6v': {
      'en': 'Scripture Journal Prompt',
      'es': 'Aviso del diario de las Escrituras',
    },
    'ufjid2ys': {
      'en': 'Responses',
      'es': 'Respuestas',
    },
    'lvy6ce3s': {
      'en': 'Completed!',
      'es': '¡Terminado!',
    },
    '4m5cwnl2': {
      'en': 'Write your response here',
      'es': 'Escribe tu respuesta aquí',
    },
    'id6uy7ce': {
      'en': 'Typing...',
      'es': 'Mecanografía...',
    },
    'cnvc6fwm': {
      'en': 'Top comments',
      'es': 'Top Comentarios',
    },
    'lxf4f1qt': {
      'en': 'Newest first',
      'es': 'El más reciente primero',
    },
  },
  // ageMissing
  {
    '3oigi1hv': {
      'en':
          'A member of this chat does not have a birthdate set. Birthdates are required due to our safety features for minors.',
      'es':
          'Esta persona ahora está bloqueada. No verá nada de su contenido y no podrán comunicarse con usted de ninguna manera.',
    },
    'doqdz68y': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // deleteGuest
  {
    '13tuzspg': {
      'en': 'Delete this user?',
      'es': '¿Eliminar esta etiqueta?',
    },
    'd77kcpvz': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    't8fiq8nb': {
      'en': 'Delete',
      'es': 'Borrar',
    },
  },
  // EmptyStateGuest
  {
    'ju3va5e5': {
      'en': 'No Guests Yet!',
      'es': '¡Aún no hay etiquetas!',
    },
    'd1pgo7yt': {
      'en': 'Create a guest through the \"Add Guest\" option below.',
      'es':
          'Cree una etiqueta a través de la opción \"Etiquetas de perfil\" en su Consola de administración.',
    },
  },
  // AccountWaiting
  {
    'kgki7vcf': {
      'en': 'Your account is waiting to be approved by an administrator. ',
      'es':
          'Esta persona ahora está bloqueada. No verá nada de su contenido y no podrán comunicarse con usted de ninguna manera.',
    },
    'w3ng9kc1': {
      'en': 'Sign Out',
      'es': 'Hecho',
    },
  },
  // AccountApproval
  {
    'r6mbi3yd': {
      'en': 'Account Approval',
      'es': 'Peticiones de amistad',
    },
    'pe0gry28': {
      'en': 'Decline',
      'es': 'Rechazar',
    },
    '5p6zvksg': {
      'en': 'Select',
      'es': 'Seleccionar',
    },
    '6hozewyp': {
      'en': 'Accept',
      'es': 'Aceptar',
    },
    '6w5xzo87': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // AccountApproved
  {
    '1njaslwm': {
      'en': 'Account accepted!',
      'es': '¡Amigo aceptó!',
    },
    'xqupfafa': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // AccountDenied
  {
    'x0ug283v': {
      'en': 'Account denied.',
      'es': 'Solicitud de amistad rechazada.',
    },
    'xjusxv27': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // EmptyStateApproval
  {
    '9l0sb2er': {
      'en':
          'That\'s all! You don\'t have any \nmore accounts waiting approval.',
      'es': '¡Eso es todo! no tienes ninguno\nMás solicitudes de amistad.',
    },
  },
  // AccountDeniedAdmin
  {
    '5zwkac9z': {
      'en':
          'Your account has been denied by an administrator. You can either make a new account, or contact your admin.',
      'es':
          'Esta persona ahora está bloqueada. No verá nada de su contenido y no podrán comunicarse con usted de ninguna manera.',
    },
    'iavpg71r': {
      'en': 'Sign Out',
      'es': 'Hecho',
    },
  },
  // followupNeeded2
  {
    '72tmwmfu': {
      'en': 'Refresh Attendance',
      'es': 'Confirmar',
    },
    'hd42t2xh': {
      'en': 'X',
      'es': 'X',
    },
    'u8bxf8f3': {
      'en': 'Remove from Group',
      'es': 'Rechazar',
    },
  },
  // newGuestFollowUp
  {
    'dn60ckm3': {
      'en': 'Reach Out',
      'es': 'Confirmar',
    },
    'dn71yowv': {
      'en': 'X',
      'es': 'X',
    },
    'o6ptn6p2': {
      'en': 'Remove',
      'es': 'Rechazar',
    },
  },
  // phoneMissing
  {
    '1isdjt3c': {
      'en': 'There is no phone number set for this guest.',
      'es':
          'Esta persona ahora está bloqueada. No verá nada de su contenido y no podrán comunicarse con usted de ninguna manera.',
    },
    '3pji4mw4': {
      'en': 'Done',
      'es': 'Hecho',
    },
  },
  // userReactions
  {
    'snojgvk7': {
      'en': 'Reactions',
      'es': 'configuraciones de chat',
    },
  },
  // attendanceCalendar
  {
    'uwwez5du': {
      'en': 'Hello,',
      'es': 'Hola,',
    },
  },
  // Miscellaneous
  {
    '9on1ycgr': {
      'en': '',
      'es': '',
    },
    'te724s3i': {
      'en': '',
      'es': '',
    },
    'xfdyz49j': {
      'en': '',
      'es': '',
    },
    'wln9qa12': {
      'en': '',
      'es': '',
    },
    'gait77qy': {
      'en': '',
      'es': '',
    },
    'jrdydzah': {
      'en': '',
      'es': '',
    },
    '84jan3vz': {
      'en': '',
      'es': '',
    },
    'qnicfhvw': {
      'en': '',
      'es': '',
    },
    'umzzdrb7': {
      'en': '',
      'es': '',
    },
    'jnxeq69p': {
      'en': '',
      'es': '',
    },
    '8qcehnzy': {
      'en': '',
      'es': '',
    },
    'qlkykhzs': {
      'en': '',
      'es': '',
    },
    'qe7fx9zz': {
      'en': '',
      'es': '',
    },
    'b1ipgyw7': {
      'en': '',
      'es': '',
    },
    '0dmrqfnr': {
      'en': '',
      'es': '',
    },
    'p7yyj6l2': {
      'en': '',
      'es': '',
    },
    '155fik6g': {
      'en': '',
      'es': '',
    },
    'p26m26nj': {
      'en': '',
      'es': '',
    },
    'zflxbwzx': {
      'en': '',
      'es': '',
    },
    'l7b4fu8f': {
      'en': '',
      'es': '',
    },
    'e43opgpt': {
      'en': '',
      'es': '',
    },
    '91rsp9gd': {
      'en': '',
      'es': '',
    },
    'tp27q8ql': {
      'en': '',
      'es': '',
    },
    'q3gg4bt8': {
      'en': '',
      'es': '',
    },
    'x5zrwojn': {
      'en': '',
      'es': '',
    },
    'uzqracqy': {
      'en': '',
      'es': '',
    },
    'p92t1ycg': {
      'en': '',
      'es': '',
    },
    'vwhyg2pw': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));

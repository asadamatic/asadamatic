import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

const port = '8000';
const localHost = '127.0.0.1';
const remoteHostUrl = 'https://asadamatic.herokuapp.com/';
const localHostUrl = 'http://$localHost:$port/';
const localHostWebSocketUrl = 'ws://$localHost:$port/';
const remoteHosWebSocketUrl = 'ws://g77mwi.deta.dev/';

// Android local host urls
const localHostAndroid = '10.0.2.2';

const localHostUrlAndroid = 'http://$localHostAndroid:$port/';

const localHostWebSocketUrlAndroid = 'ws://$localHostAndroid:$port/';

final url = kDebugMode
    ? GetPlatform.isAndroid
        ? localHostUrlAndroid
        : localHostUrl
    : remoteHostUrl;

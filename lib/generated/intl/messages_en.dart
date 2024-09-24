// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_new_card": MessageLookupByLibrary.simpleMessage("+ Add New Card"),
        "bill_details": MessageLookupByLibrary.simpleMessage("Bill Details"),
        "confirm_payment":
            MessageLookupByLibrary.simpleMessage("Confirm Payment"),
        "consultation_fee": MessageLookupByLibrary.simpleMessage("500 EGP"),
        "credit_card": MessageLookupByLibrary.simpleMessage("Credit Card"),
        "criminal_law": MessageLookupByLibrary.simpleMessage("Criminal Law"),
        "e_wallet": MessageLookupByLibrary.simpleMessage("E-Wallet"),
        "general_consultation_type":
            MessageLookupByLibrary.simpleMessage("General Consultation Type"),
        "harassment": MessageLookupByLibrary.simpleMessage("Harassment"),
        "payment": MessageLookupByLibrary.simpleMessage("Payment"),
        "sub_consultation_type":
            MessageLookupByLibrary.simpleMessage("Sub-type of consultation"),
        "wallet_balance":
            MessageLookupByLibrary.simpleMessage("Wallet Balance"),
        "wallet_balance_value": MessageLookupByLibrary.simpleMessage("1200 EGP")
      };
}

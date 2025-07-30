import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart' as pc;


/// A utility class providing AES-CBC decryption functionality using the PointyCastle library.
/// 
/// This class offers a static method to decrypt data encrypted with AES in CBC mode,
/// handling Base64-encoded keys, IVs, and ciphertexts. It validates input lengths,
/// performs decryption, removes PKCS7 padding, and returns the plaintext or an error message.
/// 
/// Example usage:
/// ```dart
/// final (result, success) = SecurityServices.decryptAesCbc(
///   base64Ciphertext,
///   base64Key: base64Key,
///   base64IV: base64IV,
/// );
/// ```
class SecurityServices {
  static (String, bool) decryptAesCbc(String base64Ciphertext,
      {required String base64Key, required String base64IV}) {
    try {
      // Decode the Base64 encoded key, IV, and ciphertext
      Uint8List key = base64.decode(base64Key);
      Uint8List iv = base64.decode(base64IV);
      Uint8List ciphertext = base64.decode(base64Ciphertext);

      // Check key length
      if (key.length != 16 && key.length != 24 && key.length != 32) {
        return (
          'Invalid key length. Key must be 16, 24, or 32 bytes long.',
          false
        );
      }

      // Check IV length
      if (iv.length != 16) {
        return ('Invalid IV length. IV must be 16 bytes long.', false);
      }

      // Check ciphertext length
      if (ciphertext.length % 16 != 0) {
        return (
          'Ciphertext length is not a multiple of the block size (16 bytes)',
          false
        );
      }

      // Create a CBC block cipher with AES
      final cipher = pc.CBCBlockCipher(pc.AESEngine())
        ..init(
            false,
            pc.ParametersWithIV<pc.KeyParameter>(
                pc.KeyParameter(key), iv)); // false for decryption

      // Decrypt the ciphertext
      Uint8List paddedPlaintext = _processBlocks(cipher, ciphertext);

      // Remove PKCS7 padding
      Uint8List plaintext = _removePadding(paddedPlaintext);

      // Convert the decrypted bytes to a string (assuming UTF-8 encoding)
      String decryptedMessage = utf8.decode(plaintext);
      return (decryptedMessage, true); // Success
    } catch (e) {
      return ("An error occurred: ${e.toString()}", false); // Failure
    }
  }

  static Uint8List _processBlocks(pc.BlockCipher cipher, Uint8List input) {
    Uint8List output = Uint8List(input.length);
    for (int offset = 0; offset < input.length; offset += cipher.blockSize) {
      cipher.processBlock(input, offset, output, offset);
    }
    return output;
  }

  static Uint8List _removePadding(Uint8List paddedPlaintext) {
    // PKCS7 padding: the last byte indicates the number of padding bytes
    int padLength = paddedPlaintext[paddedPlaintext.length - 1];
    if (padLength > paddedPlaintext.length) {
      throw Exception('Invalid padding length');
    }
    return paddedPlaintext.sublist(0, paddedPlaintext.length - padLength);
  }
}

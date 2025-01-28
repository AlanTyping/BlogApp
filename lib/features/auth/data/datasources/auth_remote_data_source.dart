import 'package:blog_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// "abstract" sirve para que la clase AuthRepository no pueda ser instanciada,
// sino que debe ser implementada por otra clase.
// (que no pueda ser instanciada significa que no se puede crear un objeto de esa clase)

// "interface" es una palabra clave que se usa para definir una clase que contiene métodos abstractos.
// esto significa que los métodos de la clase no tienen cuerpo y deben ser implementados por una subclase.
// Se usa cuando se quiere definir un contrato que otras clases deben seguir.
// Es como una especie de BluePrint.

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<String> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(
        data: {
          'name': name,
        },
        email: email,
        password: password,
      );
      if (response.user != null) {
        return response.user!.toString();
      } else {
        throw const ServerException(message: "User is Null!");
      }

      // "response.user!.toString();" es una forma de obtener el id del usuario que se ha registrado.
      // "user!" es un operador de acceso seguro que se usa para acceder a un valor de un objeto que puede ser nulo."
      // es importante colocar ! porque si el valor es nulo, se lanzará una excepción.
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }
}

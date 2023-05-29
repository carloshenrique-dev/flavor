import 'package:flavor/core/consts.dart';
import 'package:flavor/design_system/images/app_images.dart';
import 'package:flavor/modules/login/cubit/login_cubit.dart';
import 'package:flavor/modules/login/widgets/login_provider_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/services/dependency_injection.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<LoginCubit>(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AppImages.logoIcon,
                height: 230,
                width: 230,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.status == ScreenStatus.completed) {
                    context.pushNamed(AppRoutes.home.name);
                  }
                },
                builder: (context, state) {
                  switch (state.status) {
                    case ScreenStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );

                    case ScreenStatus.error:
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              'Error to sign in :)',
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  context.read<LoginCubit>().reset(),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.grey,
                              ),
                              child: Text(
                                'Try again',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );

                    default:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return LoginProviderButton(
                                color: Colors.green.withOpacity(.1),
                                onPressed: () async {
                                  await context
                                      .read<LoginCubit>()
                                      .signInWithGoogle();
                                },
                                image: AppImages.googleIcon,
                                isLeftButton: true,
                              );
                            },
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return LoginProviderButton(
                                color: Colors.grey[200]!,
                                onPressed: () async {
                                  await context
                                      .read<LoginCubit>()
                                      .signInWithGoogle();
                                },
                                image: AppImages.appleIcon,
                              );
                            },
                          ),
                        ],
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

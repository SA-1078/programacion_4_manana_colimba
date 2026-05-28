// data/remote/api/AuthApi.kt
package com.shopapp.data.remote.api

import com.shopapp.data.remote.dto.*
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.POST

interface AuthApi {
    @POST("com/shopapp/presentation/ui/auth/login/")
    suspend fun login(@Body body: LoginRequest): Response<AuthResponseDto>

    @POST("com/shopapp/presentation/ui/auth/register/")
    suspend fun register(@Body body: RegisterRequest): Response<AuthResponseDto>

    @POST("com/shopapp/presentation/ui/auth/token/refresh/")
    suspend fun refreshToken(@Body body: TokenRefreshRequest): Response<TokenRefreshResponseDto>

    @POST("com/shopapp/presentation/ui/auth/logout/")
    suspend fun logout(@Body body: LogoutRequest): Response<Unit>
}
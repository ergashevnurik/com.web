package com.Domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN, MATH, ENGLISH, RUSSIAN, PHYSICS;

    @Override
    public String getAuthority() {
        return name();
    }
}

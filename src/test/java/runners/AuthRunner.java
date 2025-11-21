package runners;

import com.intuit.karate.junit5.Karate;

public class AuthRunner {

    @Karate.Test
    Karate runAuth() {
        return Karate.run("classpath:auth/auth.feature");
    }
}

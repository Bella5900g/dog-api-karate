package runner;

import com.intuit.karate.junit5.Karate;

public class DogApiRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features");
    }
}

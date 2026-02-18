package petstore.runners;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;

@Execution(ExecutionMode.SAME_THREAD)
public class PetTestRunner {

    @Karate.Test
    Karate testPetFlow() {
        return Karate.run("classpath:petstore/pets/pet.feature")
                .relativeTo(getClass());
    }

}

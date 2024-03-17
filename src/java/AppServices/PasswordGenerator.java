/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AppServices;

import java.security.SecureRandom;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Kelum
 */
public class PasswordGenerator {
    private static final String upperCaseChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String lowerCaseChars = "abcdefghijklmnopqrstuvwxyz";
    private static final String digits = "0123456789";
    private static final String specialChars = "!@#$%^&*?~";

    private static final String combinedChars = upperCaseChars + lowerCaseChars + digits + specialChars;

    public static String generatePassword(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        // Ensure at least one character from each category is included
        password.append(upperCaseChars.charAt(random.nextInt(upperCaseChars.length())));
        password.append(lowerCaseChars.charAt(random.nextInt(lowerCaseChars.length())));
        password.append(digits.charAt(random.nextInt(digits.length())));
        password.append(specialChars.charAt(random.nextInt(specialChars.length())));

        // Fill the rest of the password with random characters
        for (int i = 4; i < length; i++) {
            int index = random.nextInt(combinedChars.length());
            password.append(combinedChars.charAt(index));
        }
        // Shuffle the password to randomize the order of characters
        String shuffledPassword = shuffle(password.toString());

        return shuffledPassword;
    }

    private static String shuffle(String input) {
        List<Character> characters = input.chars()
                .mapToObj(c -> (char) c)
                .collect(Collectors.toList());
        Collections.shuffle(characters, new SecureRandom());
        StringBuilder shuffled = new StringBuilder(characters.size());
        characters.forEach(shuffled::append);
        return shuffled.toString();
    }
}

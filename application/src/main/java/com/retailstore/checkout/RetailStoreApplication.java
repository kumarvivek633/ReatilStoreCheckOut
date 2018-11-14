package com.retailstore.checkout;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * The Class RetailStoreApplication.
 */
@SpringBootApplication(scanBasePackages = "com.retailstore.checkout.*")
@EnableAutoConfiguration
@EnableJpaRepositories("com.retailstore.checkout.*")
@EntityScan("com.retailstore.checkout.*")
public class RetailStoreApplication {

	/**
	 * The main method.
	 *
	 * @param args the arguments
	 */
	public static void main(String[] args) {
		SpringApplication.run(RetailStoreApplication.class, args);
	}

}

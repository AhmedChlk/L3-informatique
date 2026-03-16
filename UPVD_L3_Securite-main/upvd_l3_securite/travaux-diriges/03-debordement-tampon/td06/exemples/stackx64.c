/*
 * stackx64.c - Vulnerable program for StackX64 lab (Phases 1-4)
 *
 * Compilation:
 *   Phases 1-3: gcc -fno-stack-protector -no-pie -z execstack -g stackx64.c -o stackx64
 *   Phase 4:    gcc -fno-stack-protector -no-pie -g stackx64.c -o stackx64
 *
 * Disable ASLR before testing:
 *   sudo sysctl -w kernel.randomize_va_space=0
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void secret_function(void)
{
    printf("\n");
    printf("=============================================\n");
    printf("  SECRET FUNCTION REACHED!                   \n");
    printf("  You successfully redirected execution!     \n");
    printf("=============================================\n");
    printf("\n");
    exit(0);
}

void vulnerable_function(void)
{
    char buffer[64];

    printf("[DEBUG] buffer is at address: %p\n", buffer);
    printf("[DEBUG] Enter your input:\n");

    gets(buffer);  /* VULNERABLE: no bounds checking */

    printf("[DEBUG] You entered: %s\n", buffer);
}

int main(int argc, char *argv[])
{
    printf("=== StackX64 - Vulnerable Program ===\n");
    printf("[DEBUG] main() is at address:            %p\n", main);
    printf("[DEBUG] secret_function() is at address:  %p\n", secret_function);
    printf("[DEBUG] vulnerable_function() is at:      %p\n", vulnerable_function);
    printf("\n");

    vulnerable_function();

    printf("[DEBUG] Program completed normally.\n");
    return 0;
}

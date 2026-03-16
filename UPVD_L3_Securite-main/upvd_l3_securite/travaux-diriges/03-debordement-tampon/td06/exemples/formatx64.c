/*
 * formatx64.c - Format string vulnerability program (Phase 5)
 *
 * Compilation:
 *   gcc -fno-stack-protector -no-pie -U_FORTIFY_SOURCE -g formatx64.c -o formatx64
 *
 * Disable ASLR before testing:
 *   sudo sysctl -w kernel.randomize_va_space=0
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Global variable to overwrite */
int is_admin = 0;

int main(int argc, char *argv[])
{
    char buffer[256];

    if (argc < 2) {
        printf("Usage: %s <input>\n", argv[0]);
        exit(1);
    }

    strcpy(buffer, argv[1]);

    printf("=== FormatX64 - Format String Vulnerability ===\n\n");

    printf("[DEBUG] is_admin is at address: %p\n", &is_admin);
    printf("[DEBUG] is_admin value (before): %d\n\n", is_admin);

    /* VULNERABLE: format string vulnerability */
    printf(buffer);
    printf("\n\n");

    printf("[DEBUG] is_admin value (after): %d\n\n", is_admin);

    if (is_admin) {
        printf("=============================================\n");
        printf("  Admin access granted!                      \n");
        printf("=============================================\n");
    } else {
        printf("Access denied. You are not admin.\n");
    }

    return 0;
}

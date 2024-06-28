# How to generate a new SSH key pair

## RSA key pair

RSA keys are less secure and won't be covered in this guide. Please use ed25519 keys.

## ed25519 key pair

ed25519 is a more secure algorithm and preferred nowadays:


```
ssh-keygen -o -a 64 -t ed25519 -f ~/.ssh/id_your_key -C "you@example.org"
```

where:

- `id_your_key` - you can choose any name for your key. By convention, key names start with `id_*`. For example, if this key is going to be used for GitHub, you can name it `id_github`
- `you@example.org` - can be any email, a name or any identifier. Example: `felipe.dornelas@work`

example:

```
ssh-keygen -o -a 64 -t ed25519 -f ~/.ssh/id_github -C "your_github_email"
```

## Passphrases

Please set a very long and secure passphrase. Do not leave this key without a passphrase, as it would make it vulnerable to attackers. Anything above 50-100 characters would suffice. It is preferable to use a long but memorable phrase than a short but cryptic password.

You can store this passphrase inside a secure password manager (eg: 1Password or LastPass).

## Files and backup

The SSH key pair will be stored in two files. Assuming `id_your_key` is the name you chose for your SSH key:

- `~/.ssh/id_your_key` - the private key. Do not share with anyone neither store it on insecure locations.
- `~/.ssh/id_your_key.pub` - the public key. It's ok to share it with a few individuals or organizations that will interact with your key. For example, github.com.

Please backup your ssh keys to a secure location. For example, you can backup them to your password manager as well, or to an encrypted USB drive.

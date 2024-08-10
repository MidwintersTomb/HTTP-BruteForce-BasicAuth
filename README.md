# HTTP Brute Force Basic Auth

### This is a bash script that utilizes cURL to brute force authentication via HTTP basic auth by sending the username and password combinations in the URL. (Example: `https://admin:admin123@www.domain.tld`)

## Usage:

#### `./https-bfba.sh -u <usernames_file> -p <passwords_file> -d <domain_or_ip> -r <response_filter>"`

#### Example: `./https-bfba.sh -u ~/users.txt -p /usr/share/wordlists/rockyout.txt -d http://www.domain.tld -r "401 - Unauthorized"`

The response filter is text in the response that indicates failure.  Hence, the filter, as it's filtering that out to find a success.

The script will not return failures nor attempts made, it will only return successes.  If you want it to show other data, it's a pretty basic script to edit, toss in an echo $response in the while loop.

As always, you're responsible for what you do with this.  It's intended only for testing purposes.  If you do something dumb and/or illegal with it, that's on you.

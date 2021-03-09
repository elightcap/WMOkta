## README
1. download the .psm1
2. open powershell and run import-module /path/to/module
3. command is add-csvtogroup -path "/path/to/csv" -group "name of group" -key "api key"

## notes
1. needs a RW okta api key
2. expects column with header "email" in csv. Can change line 21 to $email = $user.whatevercolumn is
3. only for weedmaps okta.  can change "https://weedmaps.okta.com...." to whatever okta instance.

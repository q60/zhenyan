import net.http

fn wrap(str string, max_len int) string {
    mut res := []string{}
    mut acc := 0
    for word in str.split(' ') {
        if acc >= max_len {
            acc = word.len
            res << ['\n', word]
        } else {
            acc += word.len
            res << word
        }
    }
    return res.join(' ')
}

fn main() {
    uri := "https://api.forismatic.com/api/1.0/?" +
           "method=getQuote&format=text&lang=en"
    response := http.get(uri)?
    text := response.text.split('(')
    println("\"\e[94m\e[1m${wrap(text[0].trim_space(), 40)}\e[0m\"")
    if text.len > 1 {
        println("\e[93m${text[1].replace(')', '').trim_space()}\e[0m")
    }
}

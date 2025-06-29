#[macro_use]
extern crate rocket;
use std::env;
use std::process::Command;

#[get("/")]
fn index() -> &'static str {
    "Hello, world!"
}

#[get("/ping")]
fn ping() -> String {
    let environment = env::var("ENVIRONMENT").unwrap_or_else(|_| "Undefined".to_string());
    let hostname = Command::new("hostname")
        .output()
        .map(|output| String::from_utf8_lossy(&output.stdout).trim().to_string())
        .unwrap_or_else(|_| "Unknown".to_string());

    format!(
        "Pong from hostname: {}. Environment: {}",
        hostname, environment
    )
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index, ping])
}

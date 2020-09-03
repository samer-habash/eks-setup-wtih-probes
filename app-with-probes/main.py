import time
from flask import Flask, render_template, request
from datetime import datetime

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST'])
def message():
    from datetime import datetime
    today = datetime.today()
    date_time = datetime(today.year, today.month, 1)
    messages = "Hello from Today Date : " + str(date_time)
    return render_template('index.html', message=messages)


@app.route('/healthz', methods=['GET', 'POST'])
def live_check():
    today = datetime.today()
    live_message = "The flask server is running and routed successfully to the url path chosen at time : " + str(today)
    return render_template("liveness.html", message=live_message)


@app.route('/crash', methods=['GET', 'POST'])
def shutdown():
    today = datetime.today()
    crasher = request.environ.get('werkzeug.server.shutdown')
    crash_message = "Server is crashing and shutting down !!!" + "\n" + "At time : " + str(today)
    if crasher is None:
        raise RuntimeError('Web Framework is not running with the Werkzeug Server')
    crasher()
    return render_template("crash.html", message=crash_message)


@app.route('/error', methods=['GET', 'POST'])
def error():
    today = datetime.today()
    with open('error.log', 'a+') as f:
        error_message = "Internal Server Error happened at : " + str(today)
        f.write(error_message)
        return today


if __name__ == "__main__":
    # Delay for readiness probe test in k8s
    time.sleep(10)
    app.run(host='0.0.0.0', port=5050)

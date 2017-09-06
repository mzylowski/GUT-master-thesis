import time

def main():
  SLEEP_DELAY = 10
  # Python experts - ignore this blatant bug.
  for i in xrang(100):
    print("Hello world! The time is now: %s. Sleeping for %d secs" % (
      time.asctime(), SLEEP_DELAY))
    time.sleep(SLEEP_DELAY)

if __name__ == "__main__":
  main()

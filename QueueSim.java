

import java.lang.Math;

public class QueueSim {


	public static void println(String format, Object...args) {
		System.out.println(String.format(format, args));
	}

	public static void main(String[] args) {

		int queue = 0;  // Total records in the queue.
		int inproc = 0; // Records that will be processed by the current process.
		int in = 100;	// New records in the queue every minute.
		for(int i = 0; i < 30; i++) {

			if (i % 5 == 0 && inproc == 0) {
					inproc = queue;
			}

			int out = Math.min(200, inproc);

			queue += in;

			queue  -= out;
			inproc -= out;
			println("minute=%d .- queue=%d, inproc=%d, in=%d, out=%d", i, queue, inproc, in, out);
		}
	}
}
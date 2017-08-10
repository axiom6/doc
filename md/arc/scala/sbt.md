Adding to the unease in development were issues with the build toolchain. We
started with SBT 0.7, which offered a pleasant interface to some rather dubious
internals, but by the time SBT 0.10 came out, we'd had endless issues trying to
debug or extend SBT. We looked at using 0.10, but we found it to have the exact
same problems managing dependencies (read: Ivy), two new, different flavors of
inpenetrable, undocumented, symbol-heavy API, and an implementation which can
only be described as an idioglossia. The fact that SBT plugin authors had to
discover what "best practices" are in order to avoid making two plugins
accidentally incompatible should have been a red flag for any tool which
includes typesafety as a selling point. (The fact that I tried to write a plugin
to replace SBT's usage of Ivy with Maven's Aether library should have been a red
flag for me.) We ended up moving to Maven, which isn't pretty but works. We
jettisoned all of the SBT plugins I wrote to duplicate Maven functionality, our
IDE integration worked properly, and the rest of our release toolchain (CI,
deployment, etc.) no longer needed custom shims to work. But using Maven really
highlighted the second-class status assigned to it in the Scala ecosystem. In
addition to the "enterprisey" cat-calls and disbelief from the community, we
found out that pointing out scalac's incremental compilation bugs had gotten
that feature removed outright. Even the deprecation warning for -make: suggests
using SBT or an IDE. This emphasis on SBT being the one true way has meant the
marginalization of Maven and Ant -- the two main build tools in the Java
ecosystem. Cross-building is also crazy-making. I don't have any good solutions
for backwards compatibility, but each major Scala release being incompatible
with the previous one biases Scala developers towards newer libraries and
promotes wheel-reinventing in the general ecosystem. Most Scala releases contain
improvements in day-to-day programming (including compilation speed), but an
application developer has to wait until all their dependencies are upgraded
before they themselves can upgrade. If they can't wait, they have to take on the
maintenance burden of that library indefinitely. In order to reduce their
maintenance overhead, they naturally look for another, roughly equivalent
library with a more responsive author. Even if the older library is better-
tested, better-documented, and better-featured it will still lose out over time
as developers jump ship for something that works with Scala 2.next sooner. (It's
also worth noting that most companies using Scala at scale or in mission-
critical capacities will not immediately upgrade; the library authors they
employ will likely be similarly conservative, and the benefit their experience
brings to their code will benefit the community less and less over time. As far
as I've found, we're the only big startup in SF using 2.9.) Once in production,
Scala's runtime characteristics were the least subtle problem. At one point,
half the team was working on a distributed database, and given the write fanout
for our large networks some parts of the code could be called 10-20M times per
write. Via profiling and examining the bytecode we managed to get a 100x
improvement by adopting some simple rules:
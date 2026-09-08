# atelier-testing

Test utilities for database-backed tests using [tmp-postgres](https://github.com/jfischoff/tmp-postgres). Part of the **atelier** toolkit.

## Overview

`atelier-testing` spins up a throwaway PostgreSQL instance for integration
tests, so suites that exercise
[`atelier-db`](https://github.com/tweag/atelier-extras/tree/main/atelier-db) can run
against a real database without external setup.

## License

MIT — see [LICENSE](LICENSE).

Database schema management
--

Use github.com/golang-migrate tool to manage changes on db schema


An example code:
```
import (
	"fmt"
	"log"
	"strings"

	"embed"

	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
	"github.com/golang-migrate/migrate/v4/source/iofs"
)

//go:embed schemaxx/*.sql
var PgFS embed.FS

func MigratePgDB(dbConstring string) error {
	d, err := iofs.New(PgFS, "pg")
	if err != nil {
		log.Fatal(err)
	}

	m, err := migrate.NewWithSourceInstance("iofs", d, dbConstring)
	if err != nil {
		log.Fatal(err)
	}

	err = m.Up()
	if err != nil {
		if err != migrate.ErrNoChange {
			return err
		}
	}
	return nil
}

```

import { eq, like } from "drizzle-orm";
import { coinCreated, coinCreatedV4, creatorCoinCreated } from "./db/schema/Listener";
import { types, db, App, middlewares } from "@duneanalytics/sim-idx";

const app = App.create();
app.use("*", middlewares.authentication);

// Get all coin creation events
app.get("/coins", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(coinCreated)
      .limit(50);

    return Response.json({
      result: result,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

// Get V4 coin creation events
app.get("/coins-v4", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(coinCreatedV4)
      .limit(50);

    return Response.json({
      result: result,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

// Get creator coin creation events
app.get("/creator-coins", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(creatorCoinCreated)
      .limit(50);

    return Response.json({
      result: result,
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

// Default route for backward compatibility
app.get("/*", async (c) => {
  try {
    const result = await db
      .client(c)
      .select()
      .from(coinCreated)
      .limit(10);

    return Response.json({
      result: result,
      message: "Welcome to ZoraFactory Coin Tracker API. Use /coins, /coins-v4, or /creator-coins for specific queries."
    });
  } catch (e) {
    console.error("Database operation failed:", e);
    return Response.json({ error: (e as Error).message }, { status: 500 });
  }
});

export default app;

const request = require('supertest');
const { app } = require('../../index');

describe('Integration Tests', () => {
  let server;

  beforeAll((done) => {
    server = app.listen(done);
  });

  afterAll((done) => {
    server.close(done);
  });

  it('should return a 200 OK status code for GET request to /tour/matches', async () => {
    const response = await request(server).get('/tour/matches');
    expect(response.status).toBe(200);
  });
});
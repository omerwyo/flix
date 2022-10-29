import { Request, Response, Router } from 'express';
import { OK } from 'http-status-codes';
import { ParamsDictionary } from 'express-serve-static-core';
import { getConnection } from "typeorm";
import { Title } from 'src/entities/Title';

// Init shared
const router = Router();

/******************************************************************************
 *                      Get All Titles - "GET /api/titles/all"
 ******************************************************************************/

router.get('/all', async (req: Request, res: Response) => {
    const titles = await getConnection()
        .getRepository(Title)
        .createQueryBuilder("title")
        .getMany();
    return res.status(OK).json({titles});
});

/******************************************************************************
 *                      Get Title - "GET /api/titles/:id"
 ******************************************************************************/

router.get('/:id', async (req: Request, res: Response) => {
    const { id } = req.params as ParamsDictionary;
    const title = await getConnection()
        .createQueryBuilder()
        .select("title")
        .from(Title, "title")
        .where("title.id = :id", { id: id })
        .getOne();
    if (!title) {
        res.status(404);
        res.end();
        return;
    }
    return res.status(OK).json({title});
});

/******************************************************************************
 *                                     Export
 ******************************************************************************/

 export default router;


/******************************************************************************
 *                       Add One - "POST /api/users/add"
 ******************************************************************************/
// router.post('/add', async (req: Request, res: Response) => {
//     const {
//         user
//     } = req.body;

//     if (!user) {
//         return res.status(BAD_REQUEST).json({
//             error: paramMissingError,
//         });
//     }
//     await getConnection()
//         .createQueryBuilder()
//         .insert()
//         .into(User)
//         .values([
//             {
//                 firstName: user.firstName,
//                 lastName: user.lastName,
//                 age: user.age
//             }
//         ])
//         .execute();
//     return res.status(CREATED).end();
// });


/******************************************************************************
 *                       Update - "PUT /api/users/update"
 ******************************************************************************/
// router.put('/update', async (req: Request, res: Response) => {
//     const { user } = req.body;
//     if (!user && !user.id) {
//         return res.status(BAD_REQUEST).json({
//             error: paramMissingError,
//         });
//     }
//     await getConnection()
//         .createQueryBuilder()
//         .update(User)
//         .set({ 
//             firstName: user.firstName, 
//             lastName: user.lastName,
//             age: user.age
//         })
//         .where("id = :id", { id: user.id })
//         .execute();
//     return res.status(OK).end();
// });


/******************************************************************************
 *                    Delete - "DELETE /api/users/delete/:id"
 ******************************************************************************/
// router.delete('/delete/:id', async (req: Request, res: Response) => {
//     const { id } = req.params as ParamsDictionary;
//     await getConnection()
//         .createQueryBuilder()
//         .delete()
//         .from(User)
//         .where("id = :id", { id: id })
//         .execute();
//     return res.status(OK).end();
// });